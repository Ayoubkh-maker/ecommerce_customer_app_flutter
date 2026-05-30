import 'package:app_ecommerce/controller/homescreen_controller.dart';
import 'package:app_ecommerce/core/constant/app_colors.dart';
import 'package:app_ecommerce/core/constant/routepages.dart';
import 'package:app_ecommerce/view/widget/home/customBottombar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());

    return GetBuilder<HomeScreenControllerImp>(
        builder: (controller) => Scaffold(
              floatingActionButton: FloatingActionButton(
                splashColor: AppColor.interface,
                backgroundColor: AppColor.blueX,
                shape: const CircleBorder(),
                onPressed: () {
                  Get.toNamed(RoutePages.archive);
                },
                child: const Icon(
                  Icons.shopping_basket_outlined,
                  size: 30,
                  color: Colors.white,
                ),
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
              bottomNavigationBar: const CustomBottombar() ,
              // page li rana fiha tabda m 0
              body: controller.list.elementAt(controller.currentPage),
            ));
  }
}
