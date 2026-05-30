import 'package:app_ecommerce/core/constant/app_colors.dart';
import 'package:app_ecommerce/core/constant/app_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class InformationProfile extends StatelessWidget {
  final String nameProfile ;
  final String emailProfile ;
  const InformationProfile({super.key, required this.nameProfile, required this.emailProfile});

  @override
  Widget build(BuildContext context) {
    return   Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            Container(
              decoration: const BoxDecoration(
                  color: AppColor.brownF,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              height: Get.width / 3,
            ),
            Positioned(
                top: Get.width / 5.5,
                child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(70)),
                    child: const CircleAvatar(
                      backgroundImage:
                          AssetImage(AppImages.onBordingMoyentwo),
                      radius: 60,
                    ))),
            Positioned(
                top: Get.width / 1.9,
                child:   Text(
                  nameProfile ,
                  // "${controller.myservices.sharedPreferences.getString("name")}",
                  style: const  TextStyle(fontWeight: FontWeight.w600, fontSize: 25),
                )),
            Positioned(
              top: Get.width / 1.6,
              child: Container(
                height: 30,
                width: 180,
                decoration: const BoxDecoration(
                    color: Color(0xFFE6E7E9),
                    borderRadius: BorderRadius.all(Radius.circular(6))),
                child:  Center(child: Text(emailProfile)),
              ),
            )
          ],
        );
  }
}