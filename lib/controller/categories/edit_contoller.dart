import 'dart:io';

import 'package:efor_admin/controller/categories/view_contoller.dart';
import 'package:efor_admin/core/class/statusrequest.dart';
import 'package:efor_admin/core/constant/routes.dart';
import 'package:efor_admin/core/functions/handling_data_controller.dart';
import 'package:efor_admin/core/functions/upload_file.dart';
import 'package:efor_admin/data/data_sourse/remote/categories_data.dart';
import 'package:efor_admin/data/model/categoriesmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoriesEditController extends GetxController {
  CategoriesData cateData = CategoriesData(Get.find());

  StatusRequest statusRequest = StatusRequest.none;

  GlobalKey<FormState> formState = GlobalKey<FormState>();

  File? file;

  late CategoriesModel categoriesModel;

  late TextEditingController name;
  late TextEditingController namear;

  chooseImage() async {
    file = await fileUploadGallery(true);
    update();
  }

  editData() async {
    if (formState.currentState!.validate()) {
      statusRequest = StatusRequest.loading;

      update();

      Map data = {
        "name": name.text,
        "namear": namear.text,
        "imageold": categoriesModel.categoriesImage,
        "id": categoriesModel.categoriesId.toString(),
      };

      var response = await cateData.editeData(data, file);
      print("===================connn $response");
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        if (response['status'] == 'success') {
          Get.offNamed(AppRoutes.categoriesView);
          CategoriesViewController c = Get.find();
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
    categoriesModel = Get.arguments['categoriesModel'];
    name = TextEditingController();
    namear = TextEditingController();
    name.text = categoriesModel.categoriesName!;
    namear.text = categoriesModel.categoriesNameAr!;

    super.onInit();
  }
}
