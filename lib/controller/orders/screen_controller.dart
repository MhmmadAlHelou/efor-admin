import 'package:efor_admin/view/screen/orders/accepted.dart';
import 'package:efor_admin/view/screen/orders/archive.dart';
import 'package:efor_admin/view/screen/orders/pending.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class OrdersScreenContoller extends GetxController {
  changePage(int currentPage);
}

class OrdersScreenContollerImp extends OrdersScreenContoller {
  int currentPage = 0;

  List<Widget> listPage = [
    const OrdersPending(),
    const OrdersAccepted(),
    const OrdersArchice(),
  ];

  List bottomAppBar = [
    {'title': 'Pending', 'icon': Icons.pending_actions},
    {'title': 'Accepted ', 'icon': Icons.check_circle_outline},
    {'title': 'Archice ', 'icon': Icons.archive_outlined},
  ];

  @override
  changePage(i) {
    currentPage = i;
    update();
  }
}
