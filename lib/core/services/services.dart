import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyServices extends GetxService {
  late SharedPreferences sharedPreferences;
  Future<MyServices> init() async {
    GetPlatform.isAndroid
        ? await Firebase.initializeApp(
            options: const FirebaseOptions(
              apiKey: 'AIzaSyAnX2_MLeYSYV7FBkCW8VvMV3Y2KhRSTkk',
              appId: '1:877140194291:android:34dae9afa64bbb805b5886',
              messagingSenderId: '877140194291',
              projectId: 'ecommerce-60af8',
            ),
          )
        : await Firebase.initializeApp();
    // await Firebase.initializeApp();
    sharedPreferences = await SharedPreferences.getInstance();
    return this;
  }
}

initialServices() async {
  await Get.putAsync(() => MyServices().init());
}
