import 'package:efor_admin/controller/categories/edit_contoller.dart';
import 'package:efor_admin/core/class/handling_data_view.dart';
import 'package:efor_admin/core/constant/color.dart';
import 'package:efor_admin/core/functions/valid_input.dart';
import 'package:efor_admin/core/shared/custom_buttom.dart';
import 'package:efor_admin/core/shared/custom_text_form_global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CategoriesEdit extends StatelessWidget {
  const CategoriesEdit({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CategoriesEditController());
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Category')),
      body: GetBuilder<CategoriesEditController>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Padding(
            padding: const EdgeInsets.all(10),
            child: Form(
              key: controller.formState,
              child: ListView(
                children: [
                  CustomTextFormGlobal(
                    hintText: 'Enter Category Name',
                    labelText: 'Category Name',
                    iconData: Icons.category_outlined,
                    myController: controller.name,
                    valid: (val) {
                      return validInput(val!, 1, 30, '');
                    },
                    isNumber: false,
                  ),
                  CustomTextFormGlobal(
                    hintText: 'Enter Category Name in Arabic',
                    labelText: 'Category Name (Arabic)',
                    iconData: Icons.category_outlined,
                    myController: controller.namear,
                    valid: (val) {
                      return validInput(val!, 1, 30, '');
                    },
                    isNumber: false,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: MaterialButton(
                      color: AppColor.thirdColor,
                      textColor: AppColor.secondColor,
                      onPressed: () {
                        controller.chooseImage();
                      },
                      child: const Text('Choose Category Image'),
                    ),
                  ),
                  if (controller.file != null)
                    SvgPicture.file(controller.file!),
                  CustomButtom(
                    text: 'Save',
                    onPressed: () {
                      controller.editData();
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
