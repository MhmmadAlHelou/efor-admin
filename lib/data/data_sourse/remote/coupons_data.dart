import 'package:efor_admin/core/class/crud.dart';
import 'package:efor_admin/link_api.dart';

class CouponsData {
  Crud crud;
  CouponsData(this.crud);

  getData() async {
    var response = await crud.postData(AppLink.couponsView, {});
    return response.fold((l) => l, (r) => r);
  }

  addData(Map data) async {
    var response = await crud.postData(AppLink.couponsAdd, data);
    return response.fold((l) => l, (r) => r);
  }

  deleteData(Map data) async {
    var response = await crud.postData(AppLink.couponsDelete, data);
    return response.fold((l) => l, (r) => r);
  }

  editeData(Map data) async {
    var response = await crud.postData(AppLink.couponsEdit, data);
    return response.fold((l) => l, (r) => r);
  }
}
