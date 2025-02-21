import 'package:efor_admin/controller/orders/pending_controller.dart';
import 'package:efor_admin/core/class/handling_data_view.dart';
import 'package:efor_admin/view/widget/order/card_order_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrdersPending extends StatelessWidget {
  const OrdersPending({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrdersPendingController());
    return GetBuilder<OrdersPendingController>(
      builder: (controller) => HandlingDataView(
        statusRequest: controller.statusRequest,
        widget: ListView.builder(
          itemCount: controller.data.length,
          itemBuilder: (context, index) =>
              CardOrdersList(ordersModel: controller.data[index]),
        ),
      ),
    );
  }
}
