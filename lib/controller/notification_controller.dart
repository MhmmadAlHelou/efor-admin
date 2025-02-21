import 'package:efor_admin/core/class/statusrequest.dart';
import 'package:efor_admin/core/functions/handling_data_controller.dart';
import 'package:efor_admin/core/services/services.dart';
import 'package:efor_admin/data/data_sourse/remote/orders/notification_data.dart';
import 'package:efor_admin/data/model/notification_model.dart';
import 'package:get/get.dart';

class NotificationController extends GetxController {
  NotificationData notificationData = NotificationData(Get.find());

  List<NotificationModel> data = [];
  late StatusRequest statusRequest;

  MyServices myServices = Get.find();

  getData() async {
    data.clear();

    statusRequest = StatusRequest.loading;
    update();

    var response = await notificationData.getData();
    print("===================connn $response");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        List datalist = response['data'];
        data.addAll(datalist.map((e) => NotificationModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.faillure;
      }
    }
    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
