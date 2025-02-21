import 'package:efor_admin/controller/Coupons/view_contoller.dart';
import 'package:efor_admin/core/class/statusrequest.dart';
import 'package:efor_admin/core/constant/routes.dart';
import 'package:efor_admin/core/functions/handling_data_controller.dart';
import 'package:efor_admin/data/data_sourse/remote/coupons_data.dart';
import 'package:efor_admin/data/model/coupon_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CouponsEditController extends GetxController {
  CouponsData couponsData = CouponsData(Get.find());

  StatusRequest statusRequest = StatusRequest.none;

  GlobalKey<FormState> formState = GlobalKey<FormState>();

  late CouponModel couponModel;

  late TextEditingController name;
  late TextEditingController count;
  late TextEditingController discount;
  late TextEditingController expiredate;

  editData() async {
    if (formState.currentState!.validate()) {
      statusRequest = StatusRequest.loading;

      update();

      Map data = {
        "couponname": name.text,
        "couponcount": count.text,
        "coupondiscount": discount.text,
        "couponexpiredate": expiredate.text,
        "id": couponModel.couponId.toString(),
      };

      var response = await couponsData.editeData(data);
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
    couponModel = Get.arguments['couponModel'];
    name = TextEditingController();
    count = TextEditingController();
    discount = TextEditingController();
    expiredate = TextEditingController();
    name.text = couponModel.couponName!;
    count.text = couponModel.couponCount.toString();
    discount.text = couponModel.couponDiscount.toString();
    expiredate.text = couponModel.couponExpiredate!;

    super.onInit();
  }
}
