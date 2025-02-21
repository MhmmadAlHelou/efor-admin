import 'package:efor_admin/core/class/statusrequest.dart';
import 'package:efor_admin/core/constant/routes.dart';
import 'package:efor_admin/core/functions/handling_data_controller.dart';
import 'package:efor_admin/data/data_sourse/remote/categories_data.dart';
import 'package:efor_admin/data/model/categoriesmodel.dart';
import 'package:get/get.dart';

class CategoriesViewController extends GetxController {
  CategoriesData cateData = CategoriesData(Get.find());

  List<CategoriesModel> data = [];
  late StatusRequest statusRequest;

  getData() async {
    data.clear();

    statusRequest = StatusRequest.loading;

    update();

    var response = await cateData.getData();
    print("===================connn $response");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        List datalist = response['data'];
        data.addAll(datalist.map((e) => CategoriesModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.faillure;
      }
    }
    update();
  }

  deleteCategory(String id, String imageName, String catName) {
    Get.defaultDialog(
      title: 'Attention!',
      middleText: 'Are you sure you want to Delete this Category!',
      onCancel: () {},
      onConfirm: () {
        cateData
            .deleteData({'id': id, 'imagename': imageName, 'catname': catName});
        data.removeWhere((element) => element.categoriesId.toString() == id);
        update();
        Get.back();
      },
    );
  }

  goToEditPage(CategoriesModel categoriesModel) {
    Get.toNamed(
      AppRoutes.categoriesEdit,
      arguments: {'categoriesModel': categoriesModel},
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
