import 'package:efor_admin/controller/onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';
import '../../../data/data_sourse/static/static.dart';

class CustomSliderOnBoarding extends GetView<OnBoardingControllerImp> {
  const CustomSliderOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller.pageController,
      onPageChanged: (value) {
        controller.onPageChanged(value);
      },
      itemCount: onBoardingList.length,
      itemBuilder: (context, index) => Column(
        children: [
          Image.asset(
            onBoardingList[index].image!,
            height: Get.width / 1.3,
            fit: BoxFit.fill,
          ),
          const SizedBox(height: 40),
          Text(
            onBoardingList[index].title!,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: AppColor.black),
          ),
          const SizedBox(height: 10),
          Container(
            width: double.infinity,
            alignment: Alignment.center,
            child: Text(
              onBoardingList[index].body!,
              textAlign: TextAlign.center,
              style: const TextStyle(
                height: 2,
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: AppColor.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
