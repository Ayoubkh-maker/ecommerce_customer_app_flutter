

import 'package:app_ecommerce/core/constant/routepages.dart';
import 'package:app_ecommerce/core/middleware/mymiddleware.dart';
import 'package:app_ecommerce/view/screen/address/address.dart';
import 'package:app_ecommerce/view/screen/address/address_details.dart';
import 'package:app_ecommerce/view/screen/auth/forgetpassword/forgetPassword.dart';
import 'package:app_ecommerce/view/screen/auth/forgetpassword/ressetPassword.dart';
import 'package:app_ecommerce/view/screen/auth/forgetpassword/succes_operation.dart';
import 'package:app_ecommerce/view/screen/auth/forgetpassword/verifyCode.dart';
import 'package:app_ecommerce/view/screen/auth/login.dart';
import 'package:app_ecommerce/view/screen/auth/signup.dart';
import 'package:app_ecommerce/view/screen/auth/success_signup.dart';
import 'package:app_ecommerce/view/screen/auth/verifycode_signup.dart';
import 'package:app_ecommerce/view/screen/bottompages/cart.dart';
import 'package:app_ecommerce/view/screen/drawer/offer.dart';
import 'package:app_ecommerce/view/screen/orders/archive.dart';
import 'package:app_ecommerce/view/screen/orders/orderdetails.dart';

import 'package:app_ecommerce/view/screen/bottompages/profile.dart';
import 'package:app_ecommerce/view/screen/orders/checkout.dart';
import 'package:app_ecommerce/view/screen/favorites.dart';
import 'package:app_ecommerce/view/screen/items.dart';
import 'package:app_ecommerce/view/screen/items_details.dart';
import 'package:app_ecommerce/view/screen/onBoarding.dart';
import 'package:app_ecommerce/view/screen/orders/pending.dart';

import 'package:app_ecommerce/view/widget/home/homescreen.dart';




import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

List<GetPage<dynamic>>? routes = [
  // OnBoarning
  GetPage(name: "/"                        , page: () => const OnBoarding(),
  middlewares: [Mymiddleware()] 
  ),
  // GetPage(name: '/', page: () => const  TestView()),
  //auth
  GetPage(name: RoutePages.login           , page: () => const Login()),
  GetPage(name: RoutePages.signup          , page: () => const  Signup()),
  GetPage(name: RoutePages.verifySignup    , page: () => const VerifyCodeSignup()),
  GetPage(name: RoutePages.succesSignup    , page: () => const SuccessSignup()),
   //forget password
  GetPage(name: RoutePages.forgetPassword  , page: () => const FoergetPassword()),
  GetPage(name: RoutePages.verifyCode      , page: () => const Verifycode()),
  GetPage(name: RoutePages.ressetPassword  , page: () => const RessetPassword()),
  GetPage(name: RoutePages.succesOperation , page: () => const SuccessOperation()),
  //home
   GetPage(name: RoutePages.homePage       , page: () => const HomeScreen()),
  //items
  GetPage(name: RoutePages.items           , page: () => const ItemsPage()),        
  GetPage(name: RoutePages.itemsDatails    , page: () => const ItemsDetails()),   
  //Favorites
  GetPage(name: RoutePages.favorites       , page: () => const Favorites()), 
  //profile
  GetPage(name: RoutePages.profile         , page: () => const Profile()), 
  //cart
  GetPage(name: RoutePages.cart            , page: () => const Cart()), 
  //Address
  GetPage(name: RoutePages.addresspage     , page: () => const Address()), 
  GetPage(name: RoutePages.addressDeatils  , page: () => const AddressDetails()), 
  //checkout
  GetPage(name: RoutePages.checkout        , page: () => const Checkout()), 
  //pending
  GetPage(name: RoutePages.pending         , page: () => const Pending()),  
  //order details
  GetPage(name: RoutePages.ordersdetails   , page: () => const OrdersDetails()), 
  //archive
  GetPage(name: RoutePages.archive         , page: () => const Archive()),  
  //offer
  GetPage(name: RoutePages.offer           , page: () => const Offer()),                  

];


