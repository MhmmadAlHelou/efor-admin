import 'dart:io';

import 'package:efor_admin/core/class/crud.dart';
import 'package:efor_admin/link_api.dart';

class CategoriesData {
  Crud crud;
  CategoriesData(this.crud);

  getData() async {
    var response = await crud.postData(AppLink.categoriesView, {});
    return response.fold((l) => l, (r) => r);
  }

  addData(Map data, File file) async {
    var response =
        await crud.addRequestWithImageOne(AppLink.categoriesAdd, data, file);
    return response.fold((l) => l, (r) => r);
  }

  deleteData(Map data) async {
    var response = await crud.postData(AppLink.categoriesDelete, data);
    return response.fold((l) => l, (r) => r);
  }

  editeData(Map data, [File? file]) async {
    var response;
    if (file == null) {
      response = await crud.postData(AppLink.categoriesEdit, data);
    } else {
      response =
          await crud.addRequestWithImageOne(AppLink.categoriesEdit, data, file);
    }
    return response.fold((l) => l, (r) => r);
  }
}
