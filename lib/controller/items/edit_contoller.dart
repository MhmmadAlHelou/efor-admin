import 'dart:io';

import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:efor_admin/core/class/statusrequest.dart';
import 'package:efor_admin/core/constant/routes.dart';
import 'package:efor_admin/core/functions/handling_data_controller.dart';
import 'package:efor_admin/core/functions/upload_file.dart';
import 'package:efor_admin/data/data_sourse/remote/categories_data.dart';
import 'package:efor_admin/data/data_sourse/remote/items_data.dart';
import 'package:efor_admin/data/model/categoriesmodel.dart';
import 'package:efor_admin/data/model/itemsmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemsEditController extends GetxController {
  ItemsData itemsData = ItemsData(Get.find());

  StatusRequest statusRequest = StatusRequest.none;

  GlobalKey<FormState> formState = GlobalKey<FormState>();

  List<SelectedListItem> dropDownList = [];

  File? file;

  late ItemsModel itemsModel;

  late String active;

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

  changeActiveStatus(val) {
    active = val;
    update();
  }

  editData() async {
    if (formState.currentState!.validate()) {
      statusRequest = StatusRequest.loading;

      update();

      Map data;
      // String? oldCat;
      // String? newCat;
      if (catName.text != itemsModel.categoriesName) {
        data = {
          "id": itemsModel.itemsId.toString(),
          "imageold": itemsModel.itemsImage,
          "name": name.text,
          "namear": namear.text,
          'desc': desc.text,
          'descar': descar.text,
          'count': count.text,
          'price': price.text,
          'discount': discount.text,
          'catid': catId.text,
          'catname': catName.text,
          'active': active,
          'datenow': DateTime.now().toString(),
          'oldcat': itemsModel.categoriesName,
          'newcat': catName.text,
        };
      } else {
        data = {
          "id": itemsModel.itemsId.toString(),
          "imageold": itemsModel.itemsImage,
          "name": name.text,
          "namear": namear.text,
          'desc': desc.text,
          'descar': descar.text,
          'count': count.text,
          'price': price.text,
          'discount': discount.text,
          'catid': catId.text,
          'active': active,
          'datenow': DateTime.now().toString(),
          'oldcat': itemsModel.categoriesName,
          'newcat': itemsModel.categoriesName,
        };
      }

      var response = await itemsData.editeData(data, file);
      print("===================connn $response");
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        if (response['status'] == 'success') {
          Get.offAllNamed(AppRoutes.homePage);
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
    List<CategoriesModel> data = [];

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

    itemsModel = Get.arguments['itemsModel'];

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

    name.text = itemsModel.itemsName!;
    namear.text = itemsModel.itemsNameAr!;
    desc.text = itemsModel.itemsDesc!;
    descar.text = itemsModel.itemsDescAr!;
    count.text = itemsModel.itemsCount!.toString();
    price.text = itemsModel.itemsPrice!.toString();
    discount.text = itemsModel.itemsDiscount!.toString();

    catId.text = itemsModel.categoriesId!.toString();
    catName.text = itemsModel.categoriesName!;

    active = itemsModel.itemsActive.toString();

    super.onInit();
  }
}
