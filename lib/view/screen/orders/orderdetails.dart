import 'package:app_ecommerce/controller/orders/ordersDetails_controller.dart';
import 'package:app_ecommerce/core/class/handlingdataview.dart';
import 'package:app_ecommerce/core/constant/app_colors.dart';
import 'package:app_ecommerce/core/constant/app_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class OrdersDetails extends StatelessWidget {
  const OrdersDetails({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrdersdetailsImp());
    return GetBuilder<OrdersdetailsImp>(builder: (controller){
      return HandlingDataView(statusRequest: controller.statusRequest, widget: Scaffold(
      backgroundColor: Color.fromARGB(255, 221, 235, 240),
      appBar: AppBar(
        title: const Text(""),
        backgroundColor: Color.fromARGB(255, 221, 235, 240),
      ),
      body: SafeArea(
        child: ListView(
          clipBehavior: Clip.none,
          children: [
            Container(
                padding: const EdgeInsets.symmetric(vertical: 30),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Column(
                  children: [
                    Image.asset(
                      AppImages.pubimage,
                      height: 200,
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    // ListView.builder(
                    //   physics: NeverScrollableScrollPhysics(),
                    //   shrinkWrap: true,
                    //     itemCount: controller.data.length,
                    //     itemBuilder: (context, index) {
                    //       return CustomTableinfoOrders(controller.data[index]);
                    //     }),

                     Table(
      children:  [
        const TableRow(children: [
          Text(
            "Items",
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Text(
            "QTY",
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Text(
            "Price",
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ]),
       const  TableRow(children: [
          SizedBox(
            height: 20,
          ),
            SizedBox(
            height: 20,
          ),
            SizedBox(
            height: 20,
          ),
        ]),
        ...List.generate(controller.data.length, (index) => 
          TableRow(children: [
          Text(
            "${controller.data[index].itemsName}",
            textAlign: TextAlign.center,
          ),
          Text("${controller.data[index].itemscount}", textAlign: TextAlign.center),
          Text("${controller.data[index].itemsprice} \$", textAlign: TextAlign.center),
      //  SizedBox(height: 10,),
        ]),)

        // TableRow(children: [
        //   SizedBox(
        //     height: 10,
        //   ),
        //     SizedBox(
        //     height: 10,
        //   ),
        //     SizedBox(
        //     height: 10,
        //   ),
        // ]),

        
        
      ],
    ),
                    Container(
                      margin: const EdgeInsets.only(top: 50),
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 20),
                      decoration: BoxDecoration(
                          color: AppColor.blueZ,
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        "Total Price : ${controller.ordersModel.ordersTotalprice} \$",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                    if (controller.ordersModel.ordersType == 0)
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Container(
                            margin: const EdgeInsets.only(top: 50),
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            decoration: BoxDecoration(
                                color: AppColor.blueZ,
                                borderRadius: BorderRadius.circular(10)),
                            child: ListTile(
                              title: Text(
                                "${controller.ordersModel.addressName}",
                                style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                "${controller.ordersModel.addressCity} / ${controller.ordersModel.addressStreet}",
                                style: TextStyle(color: Colors.white),
                              ),
                            )),
                      ),
                  ],
                )),
          ],
        ),
      ),
    ));
    });
  }
}
