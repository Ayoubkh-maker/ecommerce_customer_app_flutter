import 'package:app_ecommerce/controller/orders/archive_controller.dart';

import 'package:app_ecommerce/core/constant/app_colors.dart';
import 'package:app_ecommerce/core/constant/routepages.dart';
import 'package:app_ecommerce/data/model/orders_model.dart';
import 'package:app_ecommerce/view/widget/orders/archive/custom_rating.dart';
import 'package:app_ecommerce/view/widget/orders/pending/custom_design_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';


class CustomCardArchive extends GetView<ArchiveControllerImp> {
  final OrdersModel dataPending;
  const CustomCardArchive({super.key, required this.dataPending});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 40),
          height: 250,
          width: double.infinity,
          child: InkWell(
            onTap: () {
     
            },
            child: Card(
              color: AppColor.blueASecond,
              child: Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Order Number : #${dataPending.ordersId}",
                          style: const TextStyle(
                              fontSize: 18,
                              color: AppColor.black,
                              fontWeight: FontWeight.bold),
                        ),
                        const Spacer(),
                        Text(
                            " ${Jiffy.parse(dataPending.ordersDate.toString()).fromNow()}"),
                      ],
                    ),
                    const Divider(
                      color: AppColor.blueA,
                    ),
                    Text(
                        "Order Type : ${controller.printOrderType(dataPending.ordersType.toString())}"),
                    Text("Order Price : ${dataPending.ordersPrice} \$"),
                    Text(
                        "Delivery Price : ${dataPending.orderPricedelivery} \$"),
                    Text(
                        "Payemnt Method : ${controller.printpaymentType(dataPending.ordersPaymentmethod.toString())}  "),
                    Text(
                        "Order status : ${controller.printOrderStatus(dataPending.ordersStatus.toString())}  "),
                    const Divider(
                      color: AppColor.blueA,
                    ),
                    Row(
                      children: [
                        Text(
                          "Total Price : ${dataPending.ordersTotalprice} \$",
                          style: const TextStyle(
                              color: Color.fromARGB(255, 246, 46, 32),
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        const Spacer(),
                        MaterialButton(
                          height: 30,
                          color: AppColor.blueZ,
                          onPressed: () {
                            Get.toNamed(RoutePages.ordersdetails,
                                arguments: {"odermodel": dataPending});
                          },
                          child: const Text(
                            "Details",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                               if(dataPending.ordersRating == 0)   MaterialButton(
                          height: 30,
                          minWidth: 40,
                          color: AppColor.blueZ,
                          onPressed: () {
                          ratingOrder(context , dataPending.ordersId);
                          },
                          child: const Icon(Icons.star , color: Colors.white,)
                        ),
                      
                       
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        const CustomDesignCard()
      ],
    );
  }
}
