import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:efor_admin/controller/users/view_contoller.dart';
import 'package:efor_admin/core/class/statusrequest.dart';
import 'package:efor_admin/core/constant/routes.dart';
import 'package:efor_admin/core/functions/handling_data_controller.dart';
import 'package:efor_admin/data/data_sourse/remote/users_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UsersAddController extends GetxController {
  UsersData usersData = UsersData(Get.find());

  StatusRequest statusRequest = StatusRequest.none;

  GlobalKey<FormState> formState = GlobalKey<FormState>();

  List<SelectedListItem> dropDownList = [];

  late TextEditingController userName;
  late TextEditingController password;
  late TextEditingController email;
  late TextEditingController phone;

  addData() async {
    if (formState.currentState!.validate()) {
      statusRequest = StatusRequest.loading;

      update();

      Map data = {
        "username": userName.text,
        "password": password.text,
        "email": email.text,
        "phone": phone.text,
      };

      var response = await usersData.addData(data);
      print("===================connn $response");
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        if (response['status'] == 'success') {
          Get.offNamed(AppRoutes.usersView);
          UsersViewController c = Get.find();
          c.getData();
        } else {
          Get.defaultDialog(
            title: "Warning",
            middleText: "Phone Number or Email already exists",
          );
          statusRequest = StatusRequest.faillure;
        }
      }
      update();
    }
  }

  @override
  void onInit() {
    userName = TextEditingController();
    password = TextEditingController();
    email = TextEditingController();
    phone = TextEditingController();
    super.onInit();
  }
}
