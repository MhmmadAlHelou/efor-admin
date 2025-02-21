import 'package:efor_admin/controller/home_controller.dart';
import 'package:efor_admin/core/constant/image_assets.dart';
import 'package:efor_admin/core/constant/routes.dart';
import 'package:efor_admin/view/widget/home/card_admin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeContoller);
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: ListView(children: [
        GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, mainAxisExtent: 150),
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          children: [
            CardAdminHome(
              onTap: () {
                Get.toNamed(AppRoutes.categoriesView);
              },
              title: 'Categories',
              url: AppImageAsset.categories,
            ),
            CardAdminHome(
              onTap: () {
                Get.toNamed(AppRoutes.itemsViewCategory);
              },
              title: 'Items',
              url: AppImageAsset.product,
            ),
            CardAdminHome(
              onTap: () {
                Get.toNamed(AppRoutes.usersView);
              },
              title: 'Users',
              url: AppImageAsset.users,
            ),
            CardAdminHome(
              onTap: () {
                Get.toNamed(AppRoutes.ordersHome);
              },
              title: 'Orders',
              url: AppImageAsset.orders,
            ),
            CardAdminHome(
              onTap: () {
                Get.toNamed(AppRoutes.notificationView);
              },
              title: 'Notification',
              url: AppImageAsset.notification,
            ),
            CardAdminHome(
              onTap: () {
                Get.toNamed(AppRoutes.couponsView);
              },
              title: 'Coupons',
              url: AppImageAsset.coupons,
            ),
            CardAdminHome(
              onTap: () {},
              title: 'Report',
              url: AppImageAsset.report,
            ),
          ],
        ),
      ]),
    );
  }
}
