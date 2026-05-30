import 'package:app_ecommerce/controller/cart_controller.dart';
import 'package:app_ecommerce/core/API/api_link.dart';
import 'package:app_ecommerce/core/class/handlingdataview.dart';
import 'package:app_ecommerce/view/widget/app_bare.dart';
import 'package:app_ecommerce/view/widget/cart/buttomnavigationbar.dart';
import 'package:app_ecommerce/view/widget/cart/customcountitems.dart';
import 'package:app_ecommerce/view/widget/cart/customitemsinformation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
     Get.put(CartControllerImp());
    return  Scaffold(
        bottomNavigationBar: GetBuilder<CartControllerImp>(builder: (controller){
          return HandlingDataView(statusRequest: controller.statusRequest, widget: ButtomnavigationBar(
            placeorder: (){controller.gocheckOut();
            controller.refrshPage();
            },
            controllerCoupont: controller.couponControl ,
            discount: "${controller.couponDiscount}",
            onvalideCoupon: (){ controller.couponCheck(); },
          totalprice: "${controller.getTotalprice()} \$",
        ));
        }),
        body:GetBuilder<CartControllerImp>(builder: (controller){
          return  HandlingDataView(statusRequest: controller.statusRequest, widget: SafeArea(
                child: ListView(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  children: [
                    CostumAppbare(
                      iconLeft: const Icon(Icons.arrow_back_ios),
                      doIconLeft: () {
                        controller.backDetailsItems();
                      },
                      title: "Cart",
                      iconRight: const Icon(Icons.delete_outlined),
                      doiconRight: () {},
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                     CustomCountItems(msg : "You have ${controller.totalitems} items in your cart"),
                    const SizedBox(
                      height: 20,
                    ),
                    ...List.generate(
                      controller.data.length,
                      (index) => CustomItemsInformation(
                         onAdd: () async {
                           await controller.addCart(controller.data[index].itemsId.toString()) ;
                          print("${controller.addCart(controller.data[index].itemsId.toString())}--------------------kh------------------");
                          controller.refrshPage();
                         },
                         onRemove: ()async{
                         await controller.removeCart(controller.data[index].itemsId.toString()) ;
                          controller.refrshPage();
                          },
                          name: "${controller.data[index].itemsName}",
                           price: "${controller.data[index].itemsprice!.toStringAsFixed(2)} \$", 
                           count: "${controller.data[index].itemscount}", 
                           image: "$itemsImage/${controller.data[index].itemsImage}",
                      )
                    )
                  ],
                ),
              ));
        })
              );
              
        
        }
  }

