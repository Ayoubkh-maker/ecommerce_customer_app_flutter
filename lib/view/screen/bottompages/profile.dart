import 'package:app_ecommerce/controller/profile_controller.dart';

import 'package:app_ecommerce/view/widget/profile/customInformationProfile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileControllerImp controller = Get.put(ProfileControllerImp());
    return Scaffold(
        body: SafeArea(
            child: ListView(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      children: [
      
  InformationProfile(emailProfile: controller.email , nameProfile: controller.name,),

        Padding(
          padding: const EdgeInsets.only(top: 180),
          child: Card(
            child: Column(
              children: [
              
              ...List.generate(controller.profilelist.length, (index) {
                final profilelist = controller.profilelist[index];
                return  ListTile(
                 focusColor: Colors.blue,
                  onTap: profilelist["ontap"],
                 title: Text("${profilelist["title"]}"),
                 trailing: const Icon(Icons.arrow_right) ,
                 leading: Icon(profilelist["leading"]),
                );
              })
              ],
            ),
          ),
        )
      ],
    )));
  }
}
