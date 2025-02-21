import 'package:efor_admin/core/class/crud.dart';
import 'package:efor_admin/link_api.dart';

class LoginData {
  Crud crud;
  LoginData(this.crud);

  potData(String email, String password) async {
    var response = await crud.postData(AppLink.login, {
      "email": email,
      "password": password,
    });
    return response.fold((l) => l, (r) => r);
  }
}
