import 'package:efor_admin/core/class/crud.dart';
import 'package:efor_admin/link_api.dart';

class OrdersArchiceData {
  Crud crud;
  OrdersArchiceData(this.crud);

  getData() async {
    var response = await crud.postData(AppLink.archiveOrders, {});
    return response.fold((l) => l, (r) => r);
  }
}
