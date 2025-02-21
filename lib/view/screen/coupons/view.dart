import 'package:efor_admin/controller/Coupons/view_contoller.dart';
import 'package:efor_admin/core/class/handling_data_view.dart';
import 'package:efor_admin/core/constant/color.dart';
import 'package:efor_admin/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CouponsView extends StatelessWidget {
  const CouponsView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CouponsViewController());
    return Scaffold(
      appBar: AppBar(title: const Text('Coupons')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(AppRoutes.couponsAdd);
        },
        child: const Icon(Icons.add),
      ),
      body: GetBuilder<CouponsViewController>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: WillPopScope(
            onWillPop: () => controller.goBack(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ListView.builder(
                itemCount: controller.data.length,
                itemBuilder: (context, index) => Card(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Coupon ID: ${controller.data[index].couponId!}',
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            const Spacer(),
                            Text(controller.data[index].couponExpiredate!),
                            // Text(
                            //   Jiffy(controller.data[index].couponExpiredate!,
                            //           'yyyy-MM-dd')
                            //       .yMMMMEEEEd,
                            //   style: const TextStyle(
                            //       // color: AppColor.white,
                            //       fontWeight: FontWeight.bold),
                            // ),
                          ],
                        ),
                        const Divider(),
                        Text(
                            'Coupon Name: ${controller.data[index].couponName!}'),
                        Text(
                            'Coupon Count: ${controller.data[index].couponCount!}'),
                        Text(
                            'Coupon Discount: ${controller.data[index].couponDiscount!}%'),
                        const Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            MaterialButton(
                              onPressed: () {
                                controller.goToEditPage(controller.data[index]);
                              },
                              color: AppColor.thirdColor,
                              textColor: AppColor.white,
                              child: const Row(
                                children: [
                                  Text('Edit'),
                                  Icon(Icons.edit_outlined),
                                ],
                              ),
                            ),
                            const SizedBox(width: 30),
                            MaterialButton(
                              onPressed: () {
                                controller.deleteCoupon(
                                    controller.data[index].couponId.toString());
                              },
                              color: AppColor.thirdColor,
                              textColor: AppColor.white,
                              child: const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Delete'),
                                  Icon(Icons.delete_outline),
                                ],
                              ),
                            ),
                            // IconButton(
                            //   onPressed: () {
                            //     controller.goToEditPage(controller.data[index]);
                            //   },
                            //   icon: const Icon(Icons.edit_outlined),
                            // ),
                            // const SizedBox(width: 30),
                            // IconButton(
                            //   onPressed: () {
                            //     controller.deleteCoupon(
                            //         controller.data[index].couponId.toString());
                            //   },
                            //   icon: const Icon(Icons.delete_outline),
                            // ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
