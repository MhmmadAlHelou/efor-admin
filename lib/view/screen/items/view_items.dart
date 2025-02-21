import 'package:cached_network_image/cached_network_image.dart';
import 'package:efor_admin/controller/items/view_contoller.dart';
import 'package:efor_admin/core/class/handling_data_view.dart';
import 'package:efor_admin/link_api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemsViewCard extends StatelessWidget {
  const ItemsViewCard({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsViewCardController());
    return Scaffold(
      appBar: AppBar(title: const Text('Items')),
      body: GetBuilder<ItemsViewCardController>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget:
              //  WillPopScope(
              //   onWillPop: () => controller.goBack(),
              // child:

              Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ListView.builder(
              itemCount: controller.data.length,
              itemBuilder: (context, index) => controller
                          .data[index].categoriesName ==
                      controller.categoriesModel.categoriesName
                  ? InkWell(
                      onTap: () {
                        controller.goToEditPage(controller.data[index]);
                      },
                      child: Card(
                        child: Row(
                          children: [
                            // if (controller.data[index].categoriesName ==
                            //     controller.categoriesModel.categoriesName)
                            Expanded(
                                child: Padding(
                              padding: const EdgeInsets.all(4),
                              child: CachedNetworkImage(
                                  height: 80,
                                  imageUrl:
                                      "${AppLink.imageItems}/${controller.data[index].categoriesName}/${controller.data[index].itemsImage}"),
                            )),
                            Expanded(
                                flex: 3,
                                child: ListTile(
                                  title:
                                      Text(controller.data[index].itemsName!),
                                  subtitle: Text(
                                      "${controller.data[index].itemsPrice}\$"),
                                  trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          controller.deleteItem(
                                              controller.data[index].itemsId
                                                  .toString(),
                                              controller
                                                  .data[index].itemsImage!,
                                              controller
                                                  .data[index].categoriesName!);
                                        },
                                        icon: const Icon(Icons.delete_outline),
                                      ),
                                    ],
                                  ),
                                )),
                          ],
                        ),
                      ),
                    )
                  : const SizedBox(height: 1),
            ),
          ),
          // ),
        ),
      ),
    );
  }
}
