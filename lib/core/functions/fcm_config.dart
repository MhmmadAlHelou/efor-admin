import 'package:efor_admin/controller/orders/pending_controller.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:get/get.dart';

requestPermissionNotification() async {
  await FirebaseMessaging.instance.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
}

fcmConfig() {
  FirebaseMessaging.onMessage.listen(
    (message) {
      print("============== Notification =============");
      print(message.notification!.title);
      print(message.notification!.body);
      // FlutterRingtonePlayer.playNotification();
      Get.snackbar(message.notification!.title!, message.notification!.body!);
      refreshPageNotification(message.data);
    },
  );
}

refreshPageNotification(data) {
  print('======== page ID =======');
  print(data['pageid']);
  print('======== page Name =======');
  print(data['pagename']);
  print('======== Current Route =======');
  print(Get.currentRoute);
  if (Get.currentRoute == '/orderspending' &&
      data['pagename'] == 'refreshOrderPending') {
    OrdersPendingController controller = Get.find();
    controller.refreshOrder();
  }
}
