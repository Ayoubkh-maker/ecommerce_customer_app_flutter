
import 'package:app_ecommerce/controller/homepage_controlller.dart';
import 'package:app_ecommerce/core/API/api_link.dart';
import 'package:app_ecommerce/data/model/categoriedata.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustumCategories extends GetView<HomecontrollerImp> {
  const CustumCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: const Text(
            "Categories",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
       const SizedBox(
          height: 20,
        ),
        Container(
          height: 280,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: controller.categories.length,
            separatorBuilder: ((context, index) => SizedBox(
                  width: 10,
                )),
            itemBuilder: (BuildContext context, int index) {
              return Categories(
               
                categoriesModel: CategoriesModel.fromJson(controller.categories[index]), 
                              i: index,
              );
            },
          ),
        ),
      ],
    );
  }
}

class Categories extends GetView<HomecontrollerImp> {
  final CategoriesModel categoriesModel;
  final int i;
 
  const Categories({super.key, required this.categoriesModel, required this.i  });

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        InkWell(
          onTap: () {
            controller.gotoItems(controller.categories, i ,categoriesModel.categoriesId!.toString() , controller.itemsModel  );
          },
          child: SizedBox(
            height: 200,
            width: 200,
            child: Card(
              elevation: 7,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: ColorFiltered(
                  colorFilter: ColorFilter.mode(
                      Colors.blue.withOpacity(0.1), BlendMode.saturation),
                  // colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.darken),

                  child: Image.network(
                    // "$categoriesImage/${controller.categories[index]['categories_image']}",
                    "$categoriesImage/${categoriesModel.categoriesImage}",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ),
        // Container(height: 50 , width: 200, color: Colors.orange,)
      ],
    );
  }
}
