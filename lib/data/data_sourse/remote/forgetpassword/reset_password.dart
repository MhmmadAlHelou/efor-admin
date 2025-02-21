import 'package:efor_admin/core/class/crud.dart';
import 'package:efor_admin/link_api.dart';

class ResetPasswordData {
  Crud crud;
  ResetPasswordData(this.crud);

  potData(String email, String password) async {
    var response = await crud.postData(AppLink.resetPassword, {
      "email": email,
      "password": password,
    });
    return response.fold((l) => l, (r) => r);
  }
}
