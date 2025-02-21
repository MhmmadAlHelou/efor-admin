import 'package:efor_admin/core/class/statusrequest.dart';
import 'package:efor_admin/core/constant/routes.dart';
import 'package:efor_admin/core/functions/handling_data_controller.dart';
import 'package:efor_admin/data/data_sourse/remote/users_data.dart';
import 'package:efor_admin/data/model/users_model.dart';
import 'package:get/get.dart';

class UsersViewController extends GetxController {
  UsersData usersData = UsersData(Get.find());

  List<UsersModel> data = [];
  late StatusRequest statusRequest;

  getData() async {
    data.clear();

    statusRequest = StatusRequest.loading;

    update();

    var response = await usersData.getData();
    print("===================connn $response");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        List datalist = response['data'];
        data.addAll(datalist.map((e) => UsersModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.faillure;
      }
    }
    update();
  }

  deleteCoupon(String id) {
    Get.defaultDialog(
      title: 'Attention!',
      middleText: 'Are you sure you want to Delete this User!',
      onCancel: () {},
      onConfirm: () {
        usersData.deleteData({'id': id});
        data.removeWhere((element) => element.usersId.toString() == id);
        update();
        Get.back();
      },
    );
  }

  goToEditPage(UsersModel usersModel) {
    Get.toNamed(
      AppRoutes.usersEdit,
      arguments: {'usersModel': usersModel},
    );
  }

  goBack() {
    Get.offAllNamed(AppRoutes.homePage);
    return Future.value(false);
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
