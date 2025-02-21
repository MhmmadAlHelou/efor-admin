import 'package:efor_admin/core/class/crud.dart';
import 'package:efor_admin/link_api.dart';

class OrdersPendingData {
  Crud crud;
  OrdersPendingData(this.crud);

  getData() async {
    var response = await crud.postData(AppLink.pendingOrders, {});
    return response.fold((l) => l, (r) => r);
  }

  approveData(String userid, String orderid) async {
    var response = await crud.postData(
        AppLink.approveOrders, {'usersid': userid, 'ordersid': orderid});
    return response.fold((l) => l, (r) => r);
  }
}
