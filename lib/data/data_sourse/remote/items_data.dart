import 'dart:io';

import 'package:efor_admin/core/class/crud.dart';
import 'package:efor_admin/link_api.dart';

class ItemsData {
  Crud crud;
  ItemsData(this.crud);

  getData() async {
    var response = await crud.postData(AppLink.itemsView, {});
    return response.fold((l) => l, (r) => r);
  }

  addData(Map data, File file) async {
    var response =
        await crud.addRequestWithImageOne(AppLink.itemsAdd, data, file);
    return response.fold((l) => l, (r) => r);
  }

  deleteData(Map data) async {
    var response = await crud.postData(AppLink.itemsDelete, data);
    return response.fold((l) => l, (r) => r);
  }

  editeData(Map data, [File? file]) async {
    var response;
    if (file == null) {
      response = await crud.postData(AppLink.itemsEdit, data);
    } else {
      response =
          await crud.addRequestWithImageOne(AppLink.itemsEdit, data, file);
    }
    return response.fold((l) => l, (r) => r);
  }
}
