import 'package:efor_admin/core/class/crud.dart';
import 'package:efor_admin/link_api.dart';

class HomeData {
  Crud crud;
  HomeData(this.crud);

  getData() async {
    var response = await crud.postData(AppLink.homePage, {});
    return response.fold((l) => l, (r) => r);
  }

  searchData(String search) async {
    var response = await crud.postData(AppLink.search, {'search': search});
    return response.fold((l) => l, (r) => r);
  }
}
