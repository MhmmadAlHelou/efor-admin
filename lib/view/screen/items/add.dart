import 'package:efor_admin/controller/items/add_contoller.dart';
import 'package:efor_admin/core/class/handling_data_view.dart';
import 'package:efor_admin/core/constant/color.dart';
import 'package:efor_admin/core/functions/valid_input.dart';
import 'package:efor_admin/core/shared/custom_buttom.dart';
import 'package:efor_admin/core/shared/custom_dropdownlist.dart';
import 'package:efor_admin/core/shared/custom_text_form_global.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemsAdd extends StatelessWidget {
  const ItemsAdd({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsAddController());
    return Scaffold(
      appBar: AppBar(title: const Text('Add Item')),
      body: GetBuilder<ItemsAddController>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Padding(
            padding: const EdgeInsets.all(10),
            child: Form(
              key: controller.formState,
              child: ListView(
                children: [
                  CustomTextFormGlobal(
                    hintText: 'Enter Item Name',
                    labelText: 'Item Name',
                    iconData: Icons.production_quantity_limits,
                    myController: controller.name,
                    valid: (val) {
                      return validInput(val!, 1, 30, '');
                    },
                    isNumber: false,
                  ),
                  CustomTextFormGlobal(
                    hintText: 'Enter Item Name in Arabic',
                    labelText: 'Item Name (Arabic)',
                    iconData: Icons.production_quantity_limits,
                    myController: controller.namear,
                    valid: (val) {
                      return validInput(val!, 1, 30, '');
                    },
                    isNumber: false,
                  ),
                  CustomTextFormGlobal(
                    hintText: 'Enter Item Description',
                    labelText: 'Item Description',
                    iconData: Icons.description_outlined,
                    myController: controller.desc,
                    valid: (val) {
                      return validInput(val!, 1, 200, '');
                    },
                    isNumber: false,
                  ),
                  CustomTextFormGlobal(
                    hintText: 'Enter Item Description in Arabic',
                    labelText: 'Item Description (Arabic)',
                    iconData: Icons.description_outlined,
                    myController: controller.descar,
                    valid: (val) {
                      return validInput(val!, 1, 200, '');
                    },
                    isNumber: false,
                  ),
                  CustomTextFormGlobal(
                    hintText: 'Enter Item Count',
                    labelText: 'Item Count',
                    iconData: Icons.countertops_outlined,
                    myController: controller.count,
                    valid: (val) {
                      return validInput(val!, 1, 30, '');
                    },
                    isNumber: true,
                  ),
                  CustomTextFormGlobal(
                    hintText: 'Enter Item Price',
                    labelText: 'Item Price',
                    iconData: Icons.price_change_outlined,
                    myController: controller.price,
                    valid: (val) {
                      return validInput(val!, 1, 30, '');
                    },
                    isNumber: true,
                  ),
                  CustomTextFormGlobal(
                    hintText: 'Enter Item Discount',
                    labelText: 'Item Discount',
                    iconData: Icons.discount_outlined,
                    myController: controller.discount,
                    valid: (val) {
                      return validInput(val!, 1, 30, '');
                    },
                    isNumber: true,
                  ),
                  CustomDropDownList(
                    title: 'Choose Category',
                    listData: controller.dropDownList,
                    dropDownSelectedName: controller.catName,
                    dropDownSelectedId: controller.catId,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: MaterialButton(
                      color: AppColor.thirdColor,
                      textColor: AppColor.secondColor,
                      onPressed: () {
                        controller.showOptionImage();
                      },
                      child: const Text('Choose Item Image'),
                    ),
                  ),
                  if (controller.file != null)
                    Image.file(
                      controller.file!,
                      height: 100,
                      width: 100,
                    ),
                  CustomButtom(
                    text: 'Add',
                    onPressed: () {
                      controller.addData();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
