import 'package:efor_admin/controller/auth/seccess_reset_password_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constant/color.dart';
import '../../../widget/auth/custom_buttom_auth.dart';

class SeccessResetPasswrod extends StatelessWidget {
  const SeccessResetPasswrod({super.key});

  @override
  Widget build(BuildContext context) {
    SeccessResetPasswordControllerImp controller =
        Get.put(SeccessResetPasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.backGroundColor,
        elevation: 0.0,
        title: Text(
          'Seccess',
          style: Theme.of(context)
              .textTheme
              .displayLarge!
              .copyWith(color: AppColor.grey),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            const Center(
              child: Icon(
                Icons.check_circle_outline,
                size: 200,
                color: AppColor.primaryColor,
              ),
            ),
            Text(
              'Congratulations',
              style: Theme.of(context)
                  .textTheme
                  .displayLarge!
                  .copyWith(fontSize: 30),
            ),
            const Text('Successfully Registered'),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: CustomButtomAuth(
                text: 'Go to Login',
                onPressed: () {
                  controller.goToPageLogin();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
