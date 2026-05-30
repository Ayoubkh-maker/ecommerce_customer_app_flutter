import 'package:app_ecommerce/controller/Favorites/favoritesview_controller.dart';
import 'package:app_ecommerce/core/API/api_link.dart';
import 'package:app_ecommerce/core/constant/app_colors.dart';
import 'package:app_ecommerce/data/model/favorites_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomFavoritesList extends GetView<FavoritesViewControllerImp> {
  final FavoritesModel favoritesModel;
  const CustomFavoritesList({super.key, required this.favoritesModel});

  @override
  Widget build(BuildContext context) {
   
    return InkWell(
      onTap: () {},
      child: Card(
        
        child: Padding(
          padding: const EdgeInsets.only(top: 5, left: 5, right: 5, bottom: 5),
          child: Column(
            children: [
              SizedBox(
                height: 170,
                width: 200,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: CachedNetworkImage(
                    // imageUrl: itemsImages,

                    // imageUrl :  "$itemsImage/${controller.items[index]['items_image']}",
                    imageUrl: "$itemsImage/${favoritesModel.itemsImage}",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "${favoritesModel.itemsName }",
                // itemsName,
                // controller.myservices.sharedPreferences.getString("usersid")!,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w600 , color:AppColor.blueZ,),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.only(right: 5, left: 10, bottom: 10),
                // color: Colors.amber,
                child: Expanded(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${favoritesModel.itemsPrice}\$",
                          // itemsPrice,
                          style: const TextStyle(
                              color: AppColor.blueZ,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),

                      GetBuilder<FavoritesViewControllerImp>(builder: (controller) =>   IconButton(
                            onPressed: () {
                              controller.deleteFromfav(favoritesModel.favoritesId.toString());
                            },
                            icon: const Icon(
                              Icons.delete_outline_rounded,
                              color: Color.fromARGB(255, 198, 41, 30),
                            )))

               
                      ]),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
