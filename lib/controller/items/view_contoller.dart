import 'package:efor_admin/core/class/statusrequest.dart';
import 'package:efor_admin/core/constant/routes.dart';
import 'package:efor_admin/core/functions/handling_data_controller.dart';
import 'package:efor_admin/data/data_sourse/remote/categories_data.dart';
import 'package:efor_admin/data/data_sourse/remote/items_data.dart';
import 'package:efor_admin/data/model/categoriesmodel.dart';
import 'package:efor_admin/data/model/itemsmodel.dart';
import 'package:get/get.dart';

class ItemsViewCardController extends GetxController {
  ItemsData itemsData = ItemsData(Get.find());

  List<ItemsModel> data = [];
  List<CategoriesModel> catData = [];

  late CategoriesModel categoriesModel;

  late StatusRequest statusRequest;

  getData() async {
    catData.clear();
    data.clear();

    statusRequest = StatusRequest.loading;

    update();

    var response = await itemsData.getData();
    print("===================connn $response");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        List datalist = response['data'];
        data.addAll(datalist.map((e) => ItemsModel.fromJson(e)));
        // for (int i = 0; i < catData.length; i++) {
        //   data.addAllIf(
        //       data[i].categoriesName == categoriesModel.categoriesName,
        //       datalist.map((e) => ItemsModel.fromJson(e)));
        // }
      } else {
        statusRequest = StatusRequest.faillure;
      }
    }
    update();
  }

  deleteItem(String id, String imageName, String catName) {
    Get.defaultDialog(
      title: 'Attention!',
      middleText: 'Are you sure you want to Delete this item!',
      onCancel: () {},
      onConfirm: () {
        itemsData
            .deleteData({'id': id, 'imagename': imageName, 'catname': catName});
        data.removeWhere((element) => element.itemsId.toString() == id);
        update();
        Get.back();
      },
    );
  }

  goToEditPage(ItemsModel itemsModel) {
    Get.toNamed(
      AppRoutes.itemsEdit,
      arguments: {'itemsModel': itemsModel},
    );
  }

  goBack() {
    Get.offAllNamed(AppRoutes.homePage);
    return Future.value(false);
  }

  getCategories() async {
    CategoriesData cateData = CategoriesData(Get.find());
    statusRequest = StatusRequest.loading;

    update();

    var response = await cateData.getData();
    print("===================connn $response");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        List datalist = response['data'];
        catData.addAll(datalist.map((e) => CategoriesModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.faillure;
      }
    }
    update();
  }

  @override
  void onInit() {
    getData();
    categoriesModel = Get.arguments['categoriesModel'];
    super.onInit();
  }
}
