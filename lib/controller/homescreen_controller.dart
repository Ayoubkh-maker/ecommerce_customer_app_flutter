
import 'package:app_ecommerce/view/screen/bottompages/cart.dart';
import 'package:app_ecommerce/view/screen/bottompages/profile.dart';
import 'package:app_ecommerce/view/screen/bottompages/recherche.dart';
import 'package:app_ecommerce/view/screen/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomeScreenController extends GetxController {
changePage(int i);

}
class HomeScreenControllerImp extends HomeScreenController {
 
 int currentPage = 0 ;

  @override
  changePage(int i) {
   currentPage = i ;
   update();
  }

  List<Widget> list = [
    const Home(),
    const Recherche() ,
    const Cart(),
    const Profile(),
  ];

  // List<String> listName = [
  //   "Home",
  //   "Settings",
  //   "Favorites",
  //   "profile",
  // ];

  List<IconData> listIcons = [
     Icons.home,
     Icons.search_outlined,
     Icons.shopping_cart,
     Icons.person,
  ];
  
}