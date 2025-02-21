import 'package:efor_admin/controller/orders/screen_controller.dart';
import 'package:efor_admin/view/widget/home/custom_bottom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBottomAppBarHome extends StatelessWidget {
  const CustomBottomAppBarHome({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrdersScreenContollerImp>(
      builder: (controller) => BottomAppBar(
        // shape: const CircularNotchedRectangle(),
        // notchMargin: 10,
        child: Row(
          children: [
            ...List.generate(
              controller.listPage.length,
              (index) {
                return CustomButtonAppBar(
                  onPressed: () {
                    controller.changePage(index);
                  },
                  text: controller.bottomAppBar[index]['title'],
                  iconData: controller.bottomAppBar[index]['icon'],
                  active: controller.currentPage == index ? true : false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
