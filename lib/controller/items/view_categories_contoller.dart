import 'package:efor_admin/core/class/statusrequest.dart';
import 'package:efor_admin/core/constant/routes.dart';
import 'package:efor_admin/core/functions/handling_data_controller.dart';
import 'package:efor_admin/data/data_sourse/remote/categories_data.dart';
import 'package:efor_admin/data/model/categoriesmodel.dart';
import 'package:get/get.dart';

class ItemsViewCatgorisController extends GetxController {
  // ItemsData itemsData = ItemsData(Get.find());

  // List<ItemsModel> data = [];
  List<CategoriesModel> catList = [];

  late StatusRequest statusRequest;

  // getData() async {
  //   data.clear();

  //   statusRequest = StatusRequest.loading;

  //   update();

  //   var response = await itemsData.getData();
  //   print("===================connn $response");
  //   statusRequest = handlingData(response);
  //   if (statusRequest == StatusRequest.success) {
  //     if (response['status'] == 'success') {
  //       List datalist = response['data'];
  //       data.addAll(datalist.map((e) => ItemsModel.fromJson(e)));
  //     } else {
  //       statusRequest = StatusRequest.faillure;
  //     }
  //   }
  //   update();
  // }

  // deleteItem(String id, String imageName, String catId) {
  //   Get.defaultDialog(
  //     title: 'Attention!',
  //     middleText: 'Are you sure you want to Delete this item!',
  //     onCancel: () {},
  //     onConfirm: () {
  //       itemsData
  //           .deleteData({'id': id, 'imagename': imageName, 'catid': catId});
  //       data.removeWhere((element) => element.itemsId.toString() == id);
  //       update();
  //       Get.back();
  //     },
  //   );
  // }

  goToItemsPage(CategoriesModel categoriesModel) {
    Get.toNamed(
      AppRoutes.itemsViewCard,
      arguments: {'categoriesModel': categoriesModel},
    );
  }

  // goBack() {
  //   Get.offAllNamed(AppRoutes.homePage);
  //   return Future.value(false);
  // }

  getCategories() async {
    // catList.clear();

    CategoriesData cateData = CategoriesData(Get.find());
    statusRequest = StatusRequest.loading;

    update();

    var response = await cateData.getData();
    print("===================connn $response");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        List datalist = response['data'];
        catList.addAll(datalist.map((e) => CategoriesModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.faillure;
      }
    }
    update();
  }

  @override
  void onInit() {
    getCategories();
    // getData();
    super.onInit();
  }
}
