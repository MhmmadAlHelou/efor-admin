import 'package:efor_admin/core/class/crud.dart';
import 'package:efor_admin/link_api.dart';

class OrdersDetailsData {
  Crud crud;
  OrdersDetailsData(this.crud);

  getData(String id) async {
    var response = await crud.postData(AppLink.detailsOrders, {'id': id});
    return response.fold((l) => l, (r) => r);
  }
}
