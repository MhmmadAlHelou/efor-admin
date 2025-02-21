import 'package:efor_admin/controller/notification_controller.dart';
import 'package:efor_admin/core/class/handling_data_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(NotificationController());
    return Scaffold(
      appBar: AppBar(title: const Text('Notification')),
      body: GetBuilder<NotificationController>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Padding(
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
                            'Notification ID: ${controller.data[index].notificationId!}',
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const Spacer(),
                          Text(controller.data[index].notificationDatetime!),
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
                          'Notification UserId: ${controller.data[index].notificationUserid!}'),
                      Text(
                          'Notification Title: ${controller.data[index].notificationTitle!}'),
                      Text(
                          'Notification Body: ${controller.data[index].notificationBody!}'),
                    ],
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
