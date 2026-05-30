import 'package:app_ecommerce/controller/address_controller.dart';
import 'package:app_ecommerce/view/widget/auth/customBtnSign.dart';
import 'package:app_ecommerce/view/widget/auth/custombTextfieldAuth.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressDetails extends StatelessWidget {
  const AddressDetails({super.key});

  @override
  Widget build(BuildContext context) {
    AddressControllerImp controller = Get.put(AddressControllerImp());
    return Scaffold(
        appBar: AppBar(
          title: const  Text("Address Details"),
        ),
        body: SafeArea(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 200),
            children: [
              CustomTextFieldAuth(
                isNumber: false,
                hint: "Enter your place name",
                text: "name",
                icon: Icons.home,
                controller: controller.namecontroller,
                validator: (p0) {
                  return null;
                },
              ),
              const SizedBox(height: 20),
              CustomTextFieldAuth(
                isNumber: false,
                hint: "Enter your city name",
                text: "city",
                icon: Icons.location_city,
                controller: controller.citycontroller,
                validator: (p0) {
                  return null;
                },
              ),
             const  SizedBox(height: 20),
              CustomTextFieldAuth(
                isNumber: false,
                hint: "Enter your street name",
                text: "street",
                icon: Icons.add_road,
                controller: controller.streetcontroller,
                validator: (p0) {
                  return null;
                },
              ),
             
              Container(
                margin: const EdgeInsets.only(top: 170),
                child: CustomBtnSign(onPressed: () {
                  controller.addAddress();
                 
                }, titlebtn: "Apply"),
              )
            ],
          ),
        ));
  }
}
