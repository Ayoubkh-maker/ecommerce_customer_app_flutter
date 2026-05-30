
import 'package:app_ecommerce/controller/homepage_controlller.dart';

import 'package:app_ecommerce/core/constant/app_colors.dart';
import 'package:app_ecommerce/data/model/items_models.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomCardList extends GetView<HomecontrollerImp> {
  final ItemsModel itemsModel;
  final String itemsImages;
  final String itemsName;
  final String itemsPrice;

  const CustomCardList({
    super.key,
    required this.itemsModel,
    required this.itemsImages,
    required this.itemsName,
    required this.itemsPrice,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        controller.goItemsDetails(itemsModel);
      },
      child: Card(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(top: 5, left: 5, right: 5, bottom: 10),
          child: Column(
            children: [
              SizedBox(
                height: 170,
                width: 200,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: CachedNetworkImage(
                    imageUrl: itemsImages,
      
                    // "$itemsImage/${controller.items[index]['items_image']}",
                    // "$itemsImage/${itemsModel!.itemsImage}",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                // "${itemsModel!.itemsName} ",
                itemsName,
                // controller.myservices.sharedPreferences.getString("usersId").toString(),
      
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.only(right: 15, left: 10),
                // color: Colors.amber,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        // "${itemsModel!.itemsPrice}\$",
                        itemsPrice,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                     Icon(
                            itemsModel.favorites == 1
                                ? Icons.favorite
                                : Icons.favorite_outline,
                            color: AppColor.blueZ,
                          ),
                      ]          ),
              )
      
            ],
          ),
        ),
      ),
    );
  }
}
