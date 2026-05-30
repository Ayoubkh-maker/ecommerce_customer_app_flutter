import 'package:app_ecommerce/controller/homepage_controlller.dart';
import 'package:app_ecommerce/core/class/handlingdataview.dart';
import 'package:app_ecommerce/view/widget/home/categories.dart';
import 'package:app_ecommerce/view/widget/home/customdrawer.dart';
import 'package:app_ecommerce/view/widget/home/most_popular.dart';
import 'package:app_ecommerce/view/widget/home/publicty_container.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
 Get.put(HomecontrollerImp());
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Hello !!",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold),
          ),
        ),
              drawer: const Drawer(child: CustomDrawer()),
        body: GetBuilder<HomecontrollerImp>(builder: (controller) {
          return HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: ListView(
              padding: const EdgeInsets.only(top: 25, left: 25, right: 25 ,bottom: 40),
              children: const [
            
                const SizedBox(
                  height: 50,
                ),
                 Stack(
                  children: [
                    CustomPubContainer(),
                  ],
                ),
                const SizedBox(height: 80),
                const CustumCategories(),
                const CustomMostPopular(),
              ],
            ),
          );
        }));
  }
}
