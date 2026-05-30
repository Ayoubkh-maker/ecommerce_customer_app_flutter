import 'package:app_ecommerce/core/constant/routepages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Padding(
          padding: const EdgeInsets.only(top : 30),
          child: Row(children: [
            MaterialButton(onPressed: (){
              Get.toNamed(RoutePages.offer);
              
            } , child: const Text("Offers",style: TextStyle(fontSize: 30),),),
            const Spacer(),
           const  Icon(Icons.arrow_right_alt_sharp)

          ],) 
          
          )
      ],),
    );
   
  }
}