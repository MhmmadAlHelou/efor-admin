import 'package:efor_admin/controller/orders/screen_controller.dart';
import 'package:efor_admin/view/widget/order/custom_bottom_appbar_home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrdersScreenContollerImp());
    return GetBuilder<OrdersScreenContollerImp>(
      builder: (controller) => Scaffold(
        appBar: AppBar(title: const Text('Orders')),
        bottomNavigationBar: const CustomBottomAppBarHome(),
        body: controller.listPage.elementAt(controller.currentPage),
      ),
    );
  }
}
