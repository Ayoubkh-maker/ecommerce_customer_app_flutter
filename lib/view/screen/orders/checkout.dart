import 'package:app_ecommerce/controller/orders/checkout_controller.dart';
import 'package:app_ecommerce/core/class/handlingdataview.dart';
import 'package:app_ecommerce/core/constant/app_colors.dart';
import 'package:app_ecommerce/core/constant/app_image.dart';
import 'package:app_ecommerce/view/widget/orders/checkout/custom_choose_delevery.dart';
import 'package:app_ecommerce/view/widget/orders/checkout/custom_choose_payment.dart';
import 'package:app_ecommerce/view/widget/orders/checkout/custom_shipping_address.dart';
import 'package:app_ecommerce/view/widget/orders/checkout/custom_text_payemnt.dart';
import 'package:app_ecommerce/view/widget/orders/checkout/customvalidbutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class Checkout extends StatelessWidget {
  const Checkout({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CheckoutControllerImp());
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Check out",
            style: TextStyle(color: AppColor.blueA),
          ),
        ),
        body: GetBuilder<CheckoutControllerImp>(builder: (controller) {
          return HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomTextPayemnt(
                      title: "Choose payment methode",
                      top: 20,
                      bottom: 10,
                    ),
                    CustomChoosePayment(
                      onTap: () {
                        controller.choosePayemnt("0"); // cash  =>  0
                      },
                      image: AppImages.cashDelivery,
                      title: 'Cash on Delivery',
                      changeColor:
                          controller.paymentMethode == "0" ? true : false,
                    ),
                    CustomChoosePayment(
                      onTap: () {
                        controller.choosePayemnt("1"); // card => 1
                      },
                      image: AppImages.cardPayment,
                      title: 'Payment Cards',
                      changeColor:
                          controller.paymentMethode == "1" ? true : false,
                    ),
                    const CustomTextPayemnt(
                      title: "Choose delivery type",
                      top: 0,
                      bottom: 0,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustomChooseDelivery(
                          onTap: () {
                            controller.chooseDelivery("0"); // delivery
                          },
                          image: AppImages.choosedelivery,
                          changeColor:
                              controller.deliveryTypa == "0" ? true : false,
                        ),
                        CustomChooseDelivery(
                          onTap: () {
                            controller.chooseDelivery("1"); // recive
                          },
                          image: AppImages.cashDelivery,
                          changeColor:
                              controller.deliveryTypa == "1" ? true : false,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    if (controller.deliveryTypa == "0")
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const CustomTextPayemnt(
                            title: "Shipping address",
                            top: 20,
                            bottom: 0,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          if (controller.dataShipping.isEmpty)
                            Container(
                                child:  Row(
                              children: [
                                const Text(
                                  "Please add your address from  ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: AppColor.blueA,
                                      fontSize: 16),
                                ),
                                InkWell(
                                  onTap: (){ controller.goAddress();},
                                  child: Text(
                                    "Here",
                                    style: TextStyle(
                                      decoration: TextDecoration
                                          .underline,
                                          color: AppColor.black // Adds underline
                                    ),
                                  ),
                                )
                              ],
                            )),
                          SizedBox(
                            // color: AppColor.blueA,
                            height: 180,
                            child: ListView(
                              children: [
                                ...List.generate(
                                    controller.dataShipping.length,
                                    (index) => CustomShippingAddress(
                                          place:
                                              "${controller.dataShipping[index].addressName}",
                                          cityStreet:
                                              "${controller.dataShipping[index].addressCity} / ${controller.dataShipping[index].addressStreet} ",
                                          changeColor:
                                              controller.shpppingAddress ==
                                                      controller
                                                          .dataShipping[index]
                                                          .addressId
                                                          .toString()
                                                  ? true
                                                  : false,
                                          onTap: () {
                                            controller.chooseShippingAddress(
                                                controller.dataShipping[index]
                                                    .addressId
                                                    .toString());
                                          },
                                        )),
                              ],
                            ),
                          ),
                        ],
                      ),
                    const Spacer(),
                    Align(
                        alignment: Alignment.center,
                        child: Customvalidbuttons(
                          onPressed: () {
                            controller.checkout();
                          },
                          titlebtn: "Check out",
                        ))
                  ],
                ),
              ));
        }));
  }
}
