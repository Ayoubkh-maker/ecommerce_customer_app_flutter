import 'package:app_ecommerce/controller/items_details_controller.dart';
import 'package:app_ecommerce/core/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTiPrDesc extends GetView<ItemsDetailsControllerImp> {
  const CustomTiPrDesc({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GetBuilder<ItemsDetailsControllerImp>(builder: (controller) {
          return Container(
            //  color: Colors.amber,
            padding: const EdgeInsets.only(top: 10, left: 20, right: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // for add & delete item count
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: AppColor.blueZ,
                      child: IconButton(
                        onPressed: () {
                          controller.add();
                        },
                        icon: const Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      alignment: Alignment.center,
                      height: 30,
                      width: 50,
                      color: Colors.white,
                      child: Text("${controller.countItems}"),
                    ),
                    CircleAvatar(
                        backgroundColor: AppColor.blueZ,
                        child: IconButton(
                          onPressed: () {
                            controller.remove();
                          },
                          icon: const Icon(
                            Icons.remove,
                            color: Colors.white,
                          ),
                        ))
                  ],
                ),

               controller.itemsModel!.priceDiscount != null ? Text(
                  "${controller.itemsModel!.priceDiscount!.toStringAsFixed(2)}\$",
                  style: const TextStyle(color: Colors.white, fontSize: 30),
                ) : Text("0")
              ],
            ),
          );
        }),
        const SizedBox(
          height: 10,
        ),
        // description
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text("${controller.itemsModel!.itemsDesc}",
              style: const TextStyle(color: Color.fromARGB(255, 152, 152, 152)),
              overflow: TextOverflow.ellipsis,
              maxLines: 2),
        ),
        // const  SizedBox(height: 10,),
      ],
    );
  }
}
