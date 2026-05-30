import 'package:app_ecommerce/controller/search_controller.dart';
import 'package:app_ecommerce/core/API/api_link.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListSearchItems extends GetView<SearchControllerImp> {
 
  const ListSearchItems({super.key});

  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
                    padding: const  EdgeInsets.symmetric(vertical: 30),
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: controller.data.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          controller.goItemDetails(controller.data[index]);
                        },
                        child: Card(
                          
                          child: Row(
                            children: [
                              Expanded(
                                  child: CachedNetworkImage(
                                imageUrl:
                                    "$itemsImage/${controller.data[index].itemsImage}",
                              )),
                              Expanded(
                                  flex: 2,
                                  child: ListTile(
                                    subtitle:Text("${controller.data[index].categoriesName}") ,
                                    title: Text("${controller.data[index].itemsName}",style: const TextStyle(fontWeight: FontWeight.w600),),
                                        
                                  ))
                            ],
                          ),
                        ),
                      );
                    });
  }
}