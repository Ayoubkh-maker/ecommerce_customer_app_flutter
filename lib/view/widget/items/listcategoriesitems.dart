
import 'package:app_ecommerce/controller/itemspage_controller.dart';
import 'package:app_ecommerce/core/constant/app_colors.dart';

import 'package:app_ecommerce/data/model/categoriedata.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListCategoriesItems extends GetView<ItemsControllerImp> {
  const ListCategoriesItems({super.key});



  @override
  Widget build(BuildContext context) {


    return
          SizedBox(
            height: 40,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: controller.categories.length,
              separatorBuilder: ((context, index) =>const SizedBox(
                    width: 10,
                  )),
              itemBuilder: (BuildContext context, int index) {
                return Categories(
                  categoriesModel: CategoriesModel.fromJson(controller.categories[index]), 
                                i: index,
                );
              },
            ),
          );
   
  }
}

class Categories extends GetView<ItemsControllerImp> {
  final CategoriesModel categoriesModel;
  final int i;
  const Categories({super.key, required this.categoriesModel, required this.i});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
           controller.changeItems(i , categoriesModel.categoriesId.toString());
          },
          child: GetBuilder<ItemsControllerImp>(builder: (controller) => Container(
          padding: const EdgeInsets.only(right: 20 , left:  20 , bottom: 5),
           decoration:controller.selectCat == i ? const BoxDecoration(
            border: Border(bottom: BorderSide(width: 3 , color: AppColor.brownF)),
           ) : null ,
        
           child: Text("${categoriesModel.categoriesName}",style: TextStyle(fontSize: 20),),
          ),)
        ),
        // Container(height: 50 , width: 200, color: Colors.orange,)
      ],
    );
  }
}
