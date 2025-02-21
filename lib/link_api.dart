class AppLink {
  // static const String server = "http://192.168.43.94/efor";
  static const String server = "http://192.168.1.105/efor";
  static const String imageStatic = "$server/upload";
  //__________Image___________//
  static const String imageCategories = "$imageStatic/categories";
  static const String imageItems = "$imageStatic/items";

  static const String test = "$server/test.php";
  //______________Auth______________//
  static const String verfiycodeSignUp = "$server/auth/verfiycode.php";
  static const String resnd = "$server/auth/resend.php";
  static const String login = "$server/auth/login.php";
  static const String signup = "$server/auth/signup.php";

  //_______Forget Password_________//
  static const String checkEmail = "$server/forgetpassword/checkemail.php";
  static const String resetPassword =
      "$server/forgetpassword/resetpassword.php";
  static const String verifycodeForgetPassword =
      "$server/forgetpassword/verifycode.php";

  //Home
  static const String homePage = "$server/home.php";
  //Items
  static const String items = "$server/items/items.php";
  static const String search = "$server/items/search.php";
  //Favorite
  static const String favoriteAdd = "$server/favorite/add.php";
  static const String favoriteRemove = "$server/favorite/remove.php";
  static const String favoriteView = "$server/favorite/view.php";
  static const String deleteFromFavorite =
      "$server/favorite/delete_from_favorite.php";
  //Cart
  static const String cartView = "$server/Cart/view.php";
  static const String cartAdd = "$server/Cart/add.php";
  static const String cartDelete = "$server/Cart/delete.php";
  static const String cartGetCountItems = "$server/Cart/get_count_items.php";
  //Address
  static const String addressView = "$server/address/view.php";
  static const String addressAdd = "$server/address/add.php";
  static const String addressDelete = "$server/address/delete.php";
  static const String addressEdit = "$server/address/edit.php";
  //Coupon
  static const String checkCoupon = "$server/coupon/check_coupon.php";
  //order
  static const String approveOrders = "$server/admin/orders/approve.php";
  static const String archiveOrders = "$server/admin/orders/archive.php";
  static const String prepareOrders = "$server/admin/orders/prepare.php";
  static const String acceptedOrders = "$server/admin/orders/view_accepted.php";
  static const String pendingOrders = "$server/admin/orders/view_pending.php";
  static const String detailsOrders = "$server/admin/orders/details.php";
  //notification
  static const String notification = "$server/admin/notification/view.php";
  ////
  static const String offers = "$server/offers.php";
  static const String rating = "$server/rating.php";
  //Categories
  static const String categoriesView = "$server/admin/categories/view.php";
  static const String categoriesAdd = "$server/admin/categories/add.php";
  static const String categoriesEdit = "$server/admin/categories/edit.php";
  static const String categoriesDelete = "$server/admin/categories/delete.php";
  //Coupons
  static const String couponsView = "$server/admin/coupon/view.php";
  static const String couponsAdd = "$server/admin/coupon/add.php";
  static const String couponsEdit = "$server/admin/coupon/edit.php";
  static const String couponsDelete = "$server/admin/coupon/delete.php";
  //Users
  static const String usersView = "$server/admin/users/view.php";
  static const String usersAdd = "$server/admin/users/add.php";
  static const String usersEdit = "$server/admin/users/edit.php";
  // static const String usersAprove =
  //     "$server/admin/users/change_approve_state.php";
  // static const String usersType = "$server/admin/users/change_user_type.php";
  static const String usersDelete = "$server/admin/users/delete.php";
  //Items
  static const String itemsView = "$server/admin/items/view.php";
  static const String itemsAdd = "$server/admin/items/add.php";
  static const String itemsEdit = "$server/admin/items/edit.php";
  static const String itemsDelete = "$server/admin/items/delete.php";
}
