import 'package:app_ecommerce/controller/cart_controller.dart';
import 'package:app_ecommerce/core/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ButtomnavigationBar extends GetView<CartControllerImp> {
  final Function() placeorder ;
  final String totalprice;
  final String discount;
  final void Function() onvalideCoupon;
  final TextEditingController controllerCoupont;
  const ButtomnavigationBar( 
      {super.key,
      required this.placeorder,
      required this.controllerCoupont,
      required this.totalprice,
      required this.onvalideCoupon ,
      required this.discount});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 210,
        decoration: const BoxDecoration(
            color: AppColor.blueA,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              // color: Colors.red,
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      // mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          "Discount",
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(discount,
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18)),
                      ],
                    ),
                  ),
                  Spacer(),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        TextFormField(
                          controller: controllerCoupont,
                          cursorColor: Colors.white,
                          cursorHeight: 30,
                          decoration: const InputDecoration(
                              hintText: "Add code",
                              hintStyle: TextStyle(
                                  color: Color.fromARGB(255, 211, 209, 209)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              isDense: true,
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 10)),
                        ),
                        Container(
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: MaterialButton(
                            height: 20,
                            color: AppColor.interface,
                            onPressed: onvalideCoupon,
                            child: const Text(
                              "apply",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Spacer(),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "Amount price",
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      totalprice,
                      style: const TextStyle(fontSize: 25, color: Colors.white),
                    ),
                  ],
                ),
                const Spacer(),
                InkWell(
                  onTap: placeorder,
                  child: Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          color: AppColor.blueA,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8)),
                          border: Border.all(width: 1, color: Colors.white)),
                      width: 200,
                      height: 30,
                      child: const Center(
                          child: Text("Place order",
                              style: TextStyle(color: Colors.white))),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
