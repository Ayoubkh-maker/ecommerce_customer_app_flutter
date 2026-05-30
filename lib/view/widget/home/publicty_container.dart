import 'package:app_ecommerce/controller/homepage_controlller.dart';
import 'package:app_ecommerce/core/API/api_link.dart';
import 'package:app_ecommerce/core/constant/app_colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomPubContainer extends GetView<HomecontrollerImp> {
  const CustomPubContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
          height: 180,
          width: 400,
          decoration: BoxDecoration(
            color: AppColor.interface,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 40, left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      controller.pub[0].pubTitle.toString(),
                      style: const TextStyle(
                        fontSize: 20,
                        fontFamily: "PlayfairDisplay",
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    MaterialButton(
                      // Set the minimum width of the button
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      onPressed: () {},
                      color: AppColor.blueX,
                      child: const Text(
                        "Buy Now",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                  child:CachedNetworkImage(imageUrl: "$pubimage/${controller.pub[0].pubImage}",)),
            ],
          )),
    ]);
  }
}
