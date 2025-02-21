import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:efor_admin/controller/users/view_contoller.dart';
import 'package:efor_admin/core/class/statusrequest.dart';
import 'package:efor_admin/core/constant/routes.dart';
import 'package:efor_admin/core/functions/handling_data_controller.dart';
import 'package:efor_admin/data/data_sourse/remote/users_data.dart';
import 'package:efor_admin/data/model/users_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UsersEditController extends GetxController {
  UsersData usersData = UsersData(Get.find());

  StatusRequest statusRequest = StatusRequest.none;

  GlobalKey<FormState> formState = GlobalKey<FormState>();

  List<SelectedListItem> dropDownList = [];

  late TextEditingController dropDownName;
  late TextEditingController dropDownId;

  late UsersModel usersModel;

  late String active;

  late TextEditingController userName;
  // late TextEditingController password;
  // late TextEditingController email;
  late TextEditingController phone;

  changeApproveStatus(val) {
    active = val;
    update();
  }

  editData() async {
    if (formState.currentState!.validate()) {
      statusRequest = StatusRequest.loading;

      update();

      Map data = {
        "username": userName.text,
        // "password": password.text,
        // "email": email.text,
        "phone": phone.text,
        "approve": active, //
        "type": dropDownName.text, //
        "id": usersModel.usersId.toString(),
      };

      var response = await usersData.editData(data);
      print("===================connn $response");
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        if (response['status'] == 'success') {
          Get.offNamed(AppRoutes.usersView);
          UsersViewController c = Get.find();
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
    usersModel = Get.arguments['usersModel'];
    userName = TextEditingController();
    // password = TextEditingController();
    // email = TextEditingController();
    phone = TextEditingController();

    dropDownName = TextEditingController();
    dropDownId = TextEditingController();

    userName.text = usersModel.usersName!;
    // password.text = usersModel.usersPassword!;
    // email.text = usersModel.usersEmail!;
    phone.text = usersModel.usersPhone!;
    dropDownName.text = usersModel.usersType!;
    dropDownId.text = usersModel.usersType! == 'clint'
        ? '1'
        : usersModel.usersType! == 'delivery'
            ? '2'
            : '3';

    active = usersModel.usersApprove.toString();

    dropDownList.addAll([
      SelectedListItem(name: 'clint', value: '1'),
      SelectedListItem(name: 'delivery', value: '2'),
      SelectedListItem(name: 'admin', value: '3'),
    ]);

    super.onInit();
  }
}
