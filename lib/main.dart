import 'package:efor_admin/bindings/initialbinding.dart';
import 'package:efor_admin/core/localization/change_local.dart';
import 'package:efor_admin/core/localization/translation.dart';
import 'package:efor_admin/core/services/services.dart';
import 'package:efor_admin/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: MyTranslation(),
      locale: controller.language,
      theme: controller.appTheme,
      getPages: routes,
      initialBinding: InitialBinding(),
    );
  }
}
