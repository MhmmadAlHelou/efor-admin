import 'package:efor_admin/controller/categories/view_contoller.dart';
import 'package:efor_admin/core/class/handling_data_view.dart';
import 'package:efor_admin/core/constant/routes.dart';
import 'package:efor_admin/link_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CategoriesViewController());
    return Scaffold(
      appBar: AppBar(title: const Text('Categories')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(AppRoutes.categoriesAdd);
        },
        child: const Icon(Icons.add),
      ),
      body: GetBuilder<CategoriesViewController>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: WillPopScope(
            onWillPop: () => controller.goBack(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ListView.builder(
                itemCount: controller.data.length,
                itemBuilder: (context, index) => Card(
                  child: InkWell(
                    onTap: () {
                      controller.goToEditPage(controller.data[index]);
                    },
                    child: Row(
                      children: [
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.all(4),
                          child: SvgPicture.network(
                              height: 80,
                              "${AppLink.imageCategories}/${controller.data[index].categoriesImage}"),
                        )),
                        Expanded(
                            flex: 3,
                            child: ListTile(
                              title:
                                  Text(controller.data[index].categoriesName!),
                              subtitle: Text(
                                  controller.data[index].categoriesDatetime!),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      controller.deleteCategory(
                                        controller.data[index].categoriesId
                                            .toString(),
                                        controller.data[index].categoriesImage!,
                                        controller.data[index].categoriesName!,
                                      );
                                    },
                                    icon: const Icon(Icons.delete_outline),
                                  ),
                                ],
                              ),
                            )),
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
