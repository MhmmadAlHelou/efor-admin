import 'package:efor_admin/controller/items/view_categories_contoller.dart';
import 'package:efor_admin/core/class/handling_data_view.dart';
import 'package:efor_admin/core/constant/routes.dart';
import 'package:efor_admin/link_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ItemsViewCategory extends StatelessWidget {
  const ItemsViewCategory({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsViewCatgorisController());
    return Scaffold(
      appBar: AppBar(title: const Text('Items')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(AppRoutes.itemsAdd);
        },
        child: const Icon(Icons.add),
      ),
      body: GetBuilder<ItemsViewCatgorisController>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Padding(
            padding: const EdgeInsets.all(25),
            child: ListView.builder(
              itemCount: controller.catList.length,
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  controller.goToItemsPage(controller.catList[index]);
                },
                child: Card(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.network(
                        height: 80,
                        "${AppLink.imageCategories}/${controller.catList[index].categoriesImage}",
                      ),
                      Text(controller.catList[index].categoriesName!),
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
