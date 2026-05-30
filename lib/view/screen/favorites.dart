import 'package:app_ecommerce/controller/Favorites/favoritesview_controller.dart';
import 'package:app_ecommerce/core/class/handlingdataview.dart';
import 'package:app_ecommerce/view/widget/favorites/costumlistfavorites.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Favorites extends StatelessWidget {
  const Favorites({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(FavoritesViewControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorites "),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        children: [
          GetBuilder<FavoritesViewControllerImp>(
              builder: (controller) => HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.data.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisExtent: 310,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10
                      ),
                      itemBuilder: (context, index) {
                        return CustomFavoritesList(
                          favoritesModel: (controller.data[index]),
                        );
                      })))
        ],
      ),
    );
  }
}
