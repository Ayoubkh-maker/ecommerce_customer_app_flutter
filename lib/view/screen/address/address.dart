import 'package:app_ecommerce/controller/address_controller.dart';
import 'package:app_ecommerce/core/class/handlingdataview.dart';
import 'package:app_ecommerce/core/constant/app_colors.dart';
import 'package:app_ecommerce/view/widget/app_bare.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Address extends StatelessWidget {
  const Address({super.key});

  @override
  Widget build(BuildContext context) {
    AddressControllerImp controller =Get.put(AddressControllerImp());
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
        controller.goaddressDetails();
        },
        backgroundColor: AppColor.blueX,
        elevation: 10.0,
        shape: const CircleBorder(),
        child:  const Icon(
           Icons.add,
          color: Colors.white,
        ),
      ),
      body: GetBuilder<AddressControllerImp>(builder: (controller) {
        return HandlingDataView(statusRequest: controller.statusRequest, widget:  SafeArea(
          child: ListView(
            padding:const EdgeInsets.symmetric(horizontal: 20),
        children: [
          CostumAppbare(
              title: "Address",
              doIconLeft: () {controller.back();},
              doiconRight: () {},
              iconLeft: const Icon(Icons.arrow_back_ios_new),
              iconRight: const Icon(Icons.delete_outline_outlined)),
         
         
         ...List.generate(controller.data.length, (index) =>  Card(
            margin: const EdgeInsets.symmetric(vertical: 15),
            child: ListTile(
              trailing: IconButton(onPressed: (){controller.delete(controller.data[index].addressId.toString());} , icon: const Icon(Icons.delete_outline_rounded),),
              title: Text("${controller.data[index].addressName}"),
              subtitle: Text("${controller.data[index].addressCity} / ${controller.data[index].addressStreet}"),
            
            ),
          ))
        ],
      )),);
      })
    );
  }
}
