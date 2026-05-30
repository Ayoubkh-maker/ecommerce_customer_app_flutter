
import 'package:app_ecommerce/controller/homepage_controlller.dart';
import 'package:app_ecommerce/core/API/api_link.dart';
import 'package:app_ecommerce/data/model/items_models.dart';
import 'package:app_ecommerce/view/widget/customcard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomMostPopular extends GetView<HomecontrollerImp> {
  const CustomMostPopular({super.key});

  @override
  Widget build(BuildContext context) {
   
    return       Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: Text(
            'Top Selling',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          height: 280,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            separatorBuilder: ((context, index) => SizedBox(
                  width: 10,
                )),
            itemCount: controller.items.length,
            itemBuilder: ((context, index) {

              return Items(itemsModel: ItemsModel.fromJson(controller.items[index]));
            }),
          ),
        )
      ],
    );
  }
}

class Items extends StatelessWidget {
  final ItemsModel itemsModel ;
  const Items({super.key, required this.itemsModel});

  @override
  Widget build(BuildContext context) {
    return CustomCardList(
      itemsModel: itemsModel ,
      itemsImages: "$itemsImage/${itemsModel.itemsImage}" , 
      itemsName: "${itemsModel.itemsName}",
      itemsPrice: "${itemsModel.itemsPrice}\$",
      
      );
  }
}
