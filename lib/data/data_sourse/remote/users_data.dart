import 'package:efor_admin/core/class/crud.dart';
import 'package:efor_admin/link_api.dart';

class UsersData {
  Crud crud;
  UsersData(this.crud);

  getData() async {
    var response = await crud.postData(AppLink.usersView, {});
    return response.fold((l) => l, (r) => r);
  }

  addData(Map data) async {
    var response = await crud.postData(AppLink.usersAdd, data);
    return response.fold((l) => l, (r) => r);
  }

  deleteData(Map data) async {
    var response = await crud.postData(AppLink.usersDelete, data);
    return response.fold((l) => l, (r) => r);
  }

  editData(Map data) async {
    var response = await crud.postData(AppLink.usersEdit, data);
    return response.fold((l) => l, (r) => r);
  }

  // changeApproveData(Map data) async {
  //   var response = await crud.postData(AppLink.usersAprove, data);
  //   return response.fold((l) => l, (r) => r);
  // }

  // changeTypeData(Map data) async {
  //   var response = await crud.postData(AppLink.usersType, data);
  //   return response.fold((l) => l, (r) => r);
  // }
}
