import 'package:efor_admin/controller/Coupons/view_contoller.dart';
import 'package:efor_admin/core/class/statusrequest.dart';
import 'package:efor_admin/core/constant/routes.dart';
import 'package:efor_admin/core/functions/handling_data_controller.dart';
import 'package:efor_admin/data/data_sourse/remote/coupons_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CouponsAddController extends GetxController {
  CouponsData couponsData = CouponsData(Get.find());

  StatusRequest statusRequest = StatusRequest.none;

  GlobalKey<FormState> formState = GlobalKey<FormState>();

  late TextEditingController name;
  late TextEditingController count;
  late TextEditingController discount;
  late TextEditingController expiredate;

  addData() async {
    if (formState.currentState!.validate()) {
      statusRequest = StatusRequest.loading;

      update();

      Map data = {
        "couponname": name.text,
        "couponcount": count.text,
        "coupondiscount": discount.text,
        "couponexpiredate": expiredate.text,
      };

      var response = await couponsData.addData(data);
      print("===================connn $response");
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        if (response['status'] == 'success') {
          Get.offNamed(AppRoutes.couponsView);
          CouponsViewController c = Get.find();
          c.getData();
        } else {
          statusRequest = StatusRequest.faillure;
        }
      }
      update();
    }
  }

  @override
  void onInit() {
    name = TextEditingController();
    count = TextEditingController();
    discount = TextEditingController();
    expiredate = TextEditingController();
    super.onInit();
  }
}
