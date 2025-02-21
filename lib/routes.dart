import 'package:efor_admin/view/notification/view.dart';
import 'package:efor_admin/view/screen/categories/add.dart';
import 'package:efor_admin/view/screen/categories/edit.dart';
import 'package:efor_admin/view/screen/categories/view.dart';
import 'package:efor_admin/view/screen/coupons/add.dart';
import 'package:efor_admin/view/screen/coupons/edit.dart';
import 'package:efor_admin/view/screen/coupons/view.dart';
import 'package:efor_admin/view/screen/home.dart';
import 'package:efor_admin/view/screen/items/add.dart';
import 'package:efor_admin/view/screen/items/edit.dart';
import 'package:efor_admin/view/screen/items/view_category.dart';
import 'package:efor_admin/view/screen/items/view_items.dart';
import 'package:efor_admin/view/screen/orders/details.dart';
import 'package:efor_admin/view/screen/orders/pending.dart';
import 'package:efor_admin/view/screen/orders/screen.dart';
import 'package:efor_admin/view/screen/users/add.dart';
import 'package:efor_admin/view/screen/users/edit.dart';
import 'package:efor_admin/view/screen/users/view.dart';
import 'package:get/get.dart';

import 'core/constant/routes.dart';
import 'core/middleware/mymiddleware.dart';
import 'view/screen/auth/forget_passwrod/forget_password.dart';
import 'view/screen/auth/forget_passwrod/reset_password.dart';
import 'view/screen/auth/forget_passwrod/seccess_reset_passwrod.dart';
import 'view/screen/auth/forget_passwrod/verifycode.dart';
import 'view/screen/auth/login.dart';
import 'view/screen/language.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(
      name: '/', page: () => const Language(), middlewares: [MyMiddleWare()]),
  //Auth
  GetPage(name: AppRoutes.login, page: () => const Login()),
  GetPage(name: AppRoutes.forgetPassword, page: () => const ForgetPassword()),
  GetPage(name: AppRoutes.resetPassword, page: () => const ResetPassword()),
  GetPage(
      name: AppRoutes.seccessResetPassword,
      page: () => const SeccessResetPasswrod()),
  GetPage(name: AppRoutes.verfiyCode, page: () => const VerfiyCode()),
  //OnBoarding
  // GetPage(name: AppRoutes.onBoarding, page: () => const OnBoarding()),

  ///Home
  GetPage(name: AppRoutes.homePage, page: () => const HomePage()),

  // Orders
  GetPage(name: AppRoutes.ordersHome, page: () => const OrdersScreen()),
  GetPage(name: AppRoutes.ordersDetails, page: () => const OrdersDetails()),
  GetPage(name: AppRoutes.ordersPending, page: () => const OrdersPending()),

  //Categories
  GetPage(name: AppRoutes.categoriesView, page: () => const CategoriesView()),
  GetPage(name: AppRoutes.categoriesAdd, page: () => const CategoriesAdd()),
  GetPage(name: AppRoutes.categoriesEdit, page: () => const CategoriesEdit()),
  //Coupons
  GetPage(name: AppRoutes.couponsView, page: () => const CouponsView()),
  GetPage(name: AppRoutes.couponsAdd, page: () => const CouponsAdd()),
  GetPage(name: AppRoutes.couponsEdit, page: () => const CouponsEdit()),
  //Coupons
  GetPage(name: AppRoutes.usersView, page: () => const UsersView()),
  GetPage(name: AppRoutes.usersAdd, page: () => const UsersAdd()),
  GetPage(name: AppRoutes.usersEdit, page: () => const UsersEdit()),
  //Notification
  GetPage(
      name: AppRoutes.notificationView, page: () => const NotificationView()),

  //Items
  GetPage(
      name: AppRoutes.itemsViewCategory, page: () => const ItemsViewCategory()),
  GetPage(name: AppRoutes.itemsViewCard, page: () => const ItemsViewCard()),
  GetPage(name: AppRoutes.itemsAdd, page: () => const ItemsAdd()),
  GetPage(name: AppRoutes.itemsEdit, page: () => const ItemsEdit()),
];
