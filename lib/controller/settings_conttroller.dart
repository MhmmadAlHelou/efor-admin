import 'package:efor_admin/core/constant/routes.dart';
import 'package:efor_admin/core/services/services.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

class SettingsConttroller extends GetxController {
  MyServices myServices = Get.find();
  logout() {
    Get.defaultDialog(
      title: 'Attention!',
      middleText: 'Are you sure you want to Logout!',
      textCancel: 'Cancel',
      textConfirm: 'Confirm',
      onConfirm: () {
        String userid = myServices.sharedPreferences.getString('id')!;
        FirebaseMessaging.instance.unsubscribeFromTopic('admin');
        FirebaseMessaging.instance.unsubscribeFromTopic('admin$userid');
        myServices.sharedPreferences.clear();
        Get.offAllNamed(AppRoutes.login);
      },
    );
  }
}
