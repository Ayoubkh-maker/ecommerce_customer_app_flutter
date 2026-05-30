import 'package:app_ecommerce/core/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomInputSimple extends StatelessWidget {
  final void Function() onsearch ;
  final TextEditingController? controllerSearch ;
  const CustomInputSimple({super.key,required this.onsearch, this.controllerSearch});

  @override
  Widget build(BuildContext context) {
    return  TextFormField(
                  controller: controllerSearch ,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      hintText: "Find your product",
                      hintStyle: const TextStyle(color: Color(0xFFC0C0C0)),
                      prefixIcon: IconButton(
                          onPressed:
                          onsearch , 
                          // () {
                           
                          //   // controllerSear.searchItems();
                          // },
                          icon: const Icon(
                            Icons.search,
                            color: Color(0xff6D6D6D),
                          )),
                      border: const OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(50))),
                      // enabledBorder: const OutlineInputBorder(
                      //   borderRadius: BorderRadius.all(Radius.circular(50)),
                      // ),
                      focusedBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: AppColor.brown, width: 1.5),
                          borderRadius:
                              BorderRadius.all(Radius.circular(50)))),
                );
  }
}