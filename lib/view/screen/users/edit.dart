import 'package:efor_admin/controller/users/edit_contoller.dart';
import 'package:efor_admin/core/class/handling_data_view.dart';
import 'package:efor_admin/core/functions/valid_input.dart';
import 'package:efor_admin/core/shared/custom_buttom.dart';
import 'package:efor_admin/core/shared/custom_dropdownlist.dart';
import 'package:efor_admin/core/shared/custom_text_form_global.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UsersEdit extends StatelessWidget {
  const UsersEdit({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(UsersEditController());
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Users')),
      body: GetBuilder<UsersEditController>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Padding(
            padding: const EdgeInsets.all(10),
            child: Form(
              key: controller.formState,
              child: ListView(
                children: [
                  CustomTextFormGlobal(
                    hintText: 'Enter User Name',
                    labelText: 'User Name',
                    iconData: Icons.person_2_outlined,
                    myController: controller.userName,
                    valid: (val) {
                      return validInput(val!, 3, 30, 'username');
                    },
                    isNumber: false,
                  ),
                  // CustomTextFormGlobal(
                  //   hintText: 'Enter User Email',
                  //   labelText: 'User Email',
                  //   iconData: Icons.email_outlined,
                  //   myController: controller.email,
                  //   valid: (val) {
                  //     return validInput(val!, 5, 50, 'email');
                  //   },
                  //   isNumber: false,
                  // ),
                  CustomTextFormGlobal(
                    hintText: 'Enter User Phone',
                    labelText: 'User Phone',
                    iconData: Icons.phone_android_outlined,
                    myController: controller.phone,
                    valid: (val) {
                      return validInput(val!, 7, 11, 'phone');
                    },
                    isNumber: true,
                  ),

                  // CustomTextFormGlobal(
                  //   hintText: 'Enter User Password',
                  //   labelText: 'User Password',
                  //   iconData: Icons.lock_outlined,
                  //   myController: controller.password,
                  //   valid: (val) {
                  //     return validInput(val!, 1, 30, 'password');
                  //   },
                  //   isNumber: false,
                  // ),

                  CustomDropDownList(
                    title: 'Choose User Type',
                    listData: controller.dropDownList,
                    dropDownSelectedName: controller.dropDownName,
                    dropDownSelectedId: controller.dropDownId,
                  ),
                  const SizedBox(height: 10),
                  RadioListTile(
                    title: const Text('unApprove'),
                    value: '0',
                    groupValue: controller.active,
                    onChanged: (value) {
                      controller.changeApproveStatus(value);
                    },
                  ),
                  RadioListTile(
                    title: const Text('Approve'),
                    value: '1',
                    groupValue: controller.active,
                    onChanged: (value) {
                      controller.changeApproveStatus(value);
                    },
                  ),
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
