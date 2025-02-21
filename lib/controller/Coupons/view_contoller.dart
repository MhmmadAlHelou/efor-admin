import 'package:efor_admin/core/class/statusrequest.dart';
import 'package:efor_admin/core/constant/routes.dart';
import 'package:efor_admin/core/functions/handling_data_controller.dart';
import 'package:efor_admin/data/data_sourse/remote/coupons_data.dart';
import 'package:efor_admin/data/model/coupon_model.dart';
import 'package:get/get.dart';

class CouponsViewController extends GetxController {
  CouponsData couponsData = CouponsData(Get.find());

  List<CouponModel> data = [];
  late StatusRequest statusRequest;

  getData() async {
    data.clear();

    statusRequest = StatusRequest.loading;

    update();

    var response = await couponsData.getData();
    print("===================connn $response");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        List datalist = response['data'];
        data.addAll(datalist.map((e) => CouponModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.faillure;
      }
    }
    update();
  }

  deleteCoupon(String id) {
    Get.defaultDialog(
      title: 'Attention!',
      middleText: 'Are you sure you want to Delete this Coupon!',
      onCancel: () {},
      onConfirm: () {
        couponsData.deleteData({'id': id});
        data.removeWhere((element) => element.couponId.toString() == id);
        update();
        Get.back();
      },
    );
  }

  goToEditPage(CouponModel couponModel) {
    Get.toNamed(
      AppRoutes.couponsEdit,
      arguments: {'couponModel': couponModel},
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
