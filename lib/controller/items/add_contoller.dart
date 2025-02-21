import 'dart:io';

import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:efor_admin/core/class/statusrequest.dart';
import 'package:efor_admin/core/constant/routes.dart';
import 'package:efor_admin/core/functions/handling_data_controller.dart';
import 'package:efor_admin/core/functions/upload_file.dart';
import 'package:efor_admin/data/data_sourse/remote/Items_data.dart';
import 'package:efor_admin/data/data_sourse/remote/categories_data.dart';
import 'package:efor_admin/data/model/categoriesmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemsAddController extends GetxController {
  ItemsData itemsData = ItemsData(Get.find());

  StatusRequest statusRequest = StatusRequest.none;

  GlobalKey<FormState> formState = GlobalKey<FormState>();

  List<SelectedListItem> dropDownList = [];

  File? file;

  late TextEditingController dropDownName;
  late TextEditingController dropDownId;

  late TextEditingController name;
  late TextEditingController namear;
  late TextEditingController desc;
  late TextEditingController descar;
  late TextEditingController count;
  late TextEditingController price;
  late TextEditingController discount;

  late TextEditingController catId;
  late TextEditingController catName;

  showOptionImage() {
    showBottomMenu(chooseImageCamer, chooseImageGallery);
  }

  chooseImageCamer() async {
    file = await imageUploadCamera();
    update();
  }

  chooseImageGallery() async {
    file = await fileUploadGallery();
    update();
  }

  List<CategoriesModel> data = [];

  addData() async {
    if (formState.currentState!.validate()) {
      if (catName.text == '') {
        Get.snackbar('Warning', 'Please Choose Category');
        return null;
      }
      if (file == null) {
        Get.snackbar('Warning', 'Please Choose Image');
        return null;
      }

      statusRequest = StatusRequest.loading;

      update();

      Map data = {
        "name": name.text,
        "namear": namear.text,
        'desc': desc.text,
        'descar': descar.text,
        'count': count.text,
        'price': price.text,
        'discount': discount.text,
        'catid': catId.text,
        'catname': catName.text,
        'datenow': DateTime.now().toString(),
      };

      var response = await itemsData.addData(data, file!);
      print("===================connn $response");
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        if (response['status'] == 'success') {
          Get.offNamed(AppRoutes.itemsViewCategory);

          // ItemsViewCardController c = Get.find();
          // c.getData();
        } else {
          statusRequest = StatusRequest.faillure;
        }
      }
      update();
    }
  }

  getCategories() async {
    CategoriesData cateData = CategoriesData(Get.find());
    statusRequest = StatusRequest.loading;

    update();

    var response = await cateData.getData();
    print("===================connn $response");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        List datalist = response['data'];
        data.addAll(datalist.map((e) => CategoriesModel.fromJson(e)));
        for (int i = 0; i < data.length; i++) {
          dropDownList.add(SelectedListItem(
              name: data[i].categoriesName!,
              value: data[i].categoriesId.toString()));
        }
      } else {
        statusRequest = StatusRequest.faillure;
      }
    }
    update();
  }

  @override
  void onInit() {
    getCategories();

    catId = TextEditingController();
    catName = TextEditingController();

    dropDownName = TextEditingController();
    dropDownId = TextEditingController();

    name = TextEditingController();
    namear = TextEditingController();
    desc = TextEditingController();
    descar = TextEditingController();
    count = TextEditingController();
    price = TextEditingController();
    discount = TextEditingController();
    super.onInit();
  }
}
