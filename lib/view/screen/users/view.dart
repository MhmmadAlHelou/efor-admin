import 'package:efor_admin/controller/users/view_contoller.dart';
import 'package:efor_admin/core/class/handling_data_view.dart';
import 'package:efor_admin/core/constant/color.dart';
import 'package:efor_admin/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UsersView extends StatelessWidget {
  const UsersView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(UsersViewController());
    return Scaffold(
      appBar: AppBar(title: const Text('Users')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(AppRoutes.usersAdd);
        },
        child: const Icon(Icons.add),
      ),
      body: GetBuilder<UsersViewController>(
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
                              'User ID: ${controller.data[index].usersId!}',
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            const Spacer(),
                            Text(controller.data[index].usersCreate!),
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
                        Text('User Name: ${controller.data[index].usersName!}'),
                        Text(
                            'User Email: ${controller.data[index].usersEmail!}'),
                        Text(
                            'User Phone: ${controller.data[index].usersPhone!}'),
                        Text('User Type: ${controller.data[index].usersType!}'),
                        Text(
                            'User Verfiycode: ${controller.data[index].usersVerfiycode!}'),
                        const Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            controller.data[index].usersApprove.toString() ==
                                    '1'
                                ? const Text('Approved ')
                                : const Text('unApproved '),
                            const Spacer(),
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
                                    controller.data[index].usersId.toString());
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
