import 'package:efor_admin/controller/Coupons/add_contoller.dart';
import 'package:efor_admin/core/class/handling_data_view.dart';
import 'package:efor_admin/core/functions/valid_input.dart';
import 'package:efor_admin/core/shared/custom_buttom.dart';
import 'package:efor_admin/core/shared/custom_text_form_calendar.dart';
import 'package:efor_admin/core/shared/custom_text_form_global.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CouponsAdd extends StatelessWidget {
  const CouponsAdd({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CouponsAddController());
    return Scaffold(
      appBar: AppBar(title: const Text('Add Coupons')),
      body: GetBuilder<CouponsAddController>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Padding(
            padding: const EdgeInsets.all(10),
            child: Form(
              key: controller.formState,
              child: ListView(
                children: [
                  CustomTextFormGlobal(
                    hintText: 'Enter Coupon Name',
                    labelText: 'Coupon Name',
                    iconData: Icons.discount_outlined,
                    myController: controller.name,
                    valid: (val) {
                      return validInput(val!, 1, 30, '');
                    },
                    isNumber: false,
                  ),
                  CustomTextFormGlobal(
                    hintText: 'Enter Coupon Count',
                    labelText: 'Coupon Count',
                    iconData: Icons.discount_outlined,
                    myController: controller.count,
                    valid: (val) {
                      return validInput(val!, 1, 30, '');
                    },
                    isNumber: true,
                  ),
                  CustomTextFormGlobal(
                    hintText: 'Enter Coupon Discount',
                    labelText: 'Coupon Discount',
                    iconData: Icons.discount_outlined,
                    myController: controller.discount,
                    valid: (val) {
                      return validInput(val!, 1, 30, '');
                    },
                    isNumber: true,
                  ),
                  CustomTextFormCalendar(
                    hintText: 'Enter Coupon Expiredate',
                    labelText: 'Coupon Expiredate',
                    iconData: Icons.date_range_outlined,
                    myController: controller.expiredate,
                    valid: (val) {
                      return validInput(val!, 1, 30, '');
                    },
                  ),
                  CustomButtom(
                    text: 'Add',
                    onPressed: () {
                      controller.addData();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
