import 'package:efor_admin/core/class/crud.dart';
import 'package:efor_admin/link_api.dart';

class NotificationData {
  Crud crud;
  NotificationData(this.crud);

  getData() async {
    var response = await crud.postData(AppLink.notification, {});
    return response.fold((l) => l, (r) => r);
  }
}
