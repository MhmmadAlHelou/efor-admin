import 'package:efor_admin/core/constant/routes.dart';
import 'package:efor_admin/core/services/services.dart';
import 'package:efor_admin/data/data_sourse/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class OnBoardingController extends GetxController {
  next();
  onPageChanged(int index);
}

class OnBoardingControllerImp extends OnBoardingController {
  late PageController pageController;
  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }

  int currentPage = 0;

  MyServices myServoces = Get.find();

  @override
  next() {
    currentPage++;
    if (currentPage > onBoardingList.length - 1) {
      myServoces.sharedPreferences.setString('step', '1');
      Get.offAllNamed(AppRoutes.login);
    } else {
      pageController.animateToPage(
        currentPage,
        duration: const Duration(milliseconds: 900),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  onPageChanged(int index) {
    currentPage = index;
    update();
  }
}
