import 'package:efor_admin/controller/orders/accepted_controller.dart';
import 'package:efor_admin/core/class/handling_data_view.dart';
import 'package:efor_admin/view/widget/order/card_order_list_accepted.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrdersAccepted extends StatelessWidget {
  const OrdersAccepted({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrdersAcceptedController());
    return GetBuilder<OrdersAcceptedController>(
      builder: (controller) => HandlingDataView(
        statusRequest: controller.statusRequest,
        widget: ListView.builder(
          itemCount: controller.data.length,
          itemBuilder: (context, index) =>
              CardOrdersListAccepted(ordersModel: controller.data[index]),
        ),
      ),
    );
  }
}
