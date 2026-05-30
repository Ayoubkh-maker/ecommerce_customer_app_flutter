import 'package:app_ecommerce/controller/Favorites/favorites_controlller.dart';
import 'package:app_ecommerce/controller/offer_controller.dart';
import 'package:app_ecommerce/core/API/api_link.dart';
import 'package:app_ecommerce/core/constant/app_colors.dart';
import 'package:app_ecommerce/core/constant/app_image.dart';
import 'package:app_ecommerce/data/model/items_models.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomListoffer extends GetView<OfferControllerImp> {
  final ItemsModel itemsModel;
  const CustomListoffer({super.key, required this.itemsModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
   
        },
        child: Stack(
          children: [
            Card(
              color: Colors.white,
              child: Padding(
                padding:
                    const EdgeInsets.only(top: 5, left: 5, right: 5, bottom: 8),
                child: Column(
                  children: [
                    SizedBox(
                      height: 170,
                      width: 200,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Hero(
                          tag: "${itemsModel.itemsId}",
                          child: CachedNetworkImage(
                            // imageUrl: itemsImages,

                            // imageUrl :  "$itemsImage/${controller.items[index]['items_image']}",
                            imageUrl: "$itemsImage/${itemsModel.itemsImage}",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "${itemsModel.itemsName} ",
                      // itemsName,
                      // controller.myservices.sharedPreferences.getString("usersid")!,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w600),
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
                         itemsModel.itemsDiscount != 0 ?   Column(
                              children: [
                                Text(
                                  "${itemsModel.itemsPrice}\$",
                                  // itemsPrice,
                                  style: const TextStyle(
                                    color: Colors.red,
                                    fontSize: 16, fontWeight: FontWeight.w600,
                                    decoration: TextDecoration
                                        .lineThrough, // Adds the line through the text
                                    decorationColor: Colors
                                        .red, // Sets the color of the line
                                    decorationThickness: 2.0,
                                  ),
                                ),
                                Text(
                                  "${itemsModel.priceDiscount!.toStringAsFixed(2)}\$",
                                  // itemsPrice,
                                  style: const TextStyle(
                                      color: AppColor.blueZ,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ) :   Text(
                                  "${itemsModel.itemsPrice!.toStringAsFixed(2)}\$",
                                  // itemsPrice,
                                  style: const TextStyle(
                                      color: AppColor.blueZ,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),

                            // IconButton(
                            //   onPressed: () {},
                            //   icon: Icon(
                            //     itemsModel.favorites == 1
                            //         ? Icons.favorite
                            //         : Icons.favorite_outline,
                            //     color: AppColor.brownF,
                            //   ),
                            // )

                            GetBuilder<FavoritesControlllerImp>(
                                builder: (controller) {
                              return IconButton(
                                  onPressed: () {
                                    if (controller
                                            .isFavorites[itemsModel.itemsId] ==
                                        1) {
                                      controller.setFavorites(
                                          itemsModel.itemsId, 0);
                                      controller.removeFavorie(
                                          itemsModel.itemsId.toString());
                                    } else {
                                      controller.setFavorites(
                                          itemsModel.itemsId, 1);
                                      controller.addFavorites(
                                          itemsModel.itemsId.toString());
                                    }
                                  },
                                  icon: Icon(
                                    controller.isFavorites[
                                                itemsModel.itemsId] ==
                                            1
                                        ? Icons.favorite
                                        : Icons.favorite_outline,
                                    color: AppColor.blueZ,
                                  ));
                            })
                          ]),
                    )
                  ],
                ),
              ),
            ),
            if (itemsModel.itemsDiscount != 0)
              Image.asset(
                AppImages.sale,
                height: 50,
              ),
          ],
        ));
  }
}
