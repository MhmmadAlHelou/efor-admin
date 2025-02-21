import 'package:efor_admin/core/class/crud.dart';
import 'package:efor_admin/link_api.dart';

class OrdersAcceptedData {
  Crud crud;
  OrdersAcceptedData(this.crud);

  getData() async {
    var response = await crud.postData(AppLink.acceptedOrders, {});
    return response.fold((l) => l, (r) => r);
  }

  donePrepareData(String ordersId, String usersId, String orderType) async {
    var response = await crud.postData(AppLink.prepareOrders, {
      'ordersid': ordersId,
      'usersid': usersId,
      'ordertype': orderType,
    });
    return response.fold((l) => l, (r) => r);
  }
}
