// ignore_for_file: file_names

import 'package:app_ecommerce/core/constant/app_colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextFieldAuth extends StatelessWidget {
  final String hint;
  final String text;
  final IconData icon;
  final TextEditingController? controller;
  final String? Function(String?)? validator ;
  final bool isNumber ;
  final bool? obscure ;
  final void Function()? ontapicon;
  
  const CustomTextFieldAuth(
      {super.key,
      this.obscure ,
      required this.validator ,
      required this.hint,
      required this.text,
      required this.icon,
      this.controller, required this.isNumber, this.ontapicon, 
});

  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      obscureText: obscure == null || obscure == false ? false : true ,
      keyboardType: isNumber ? const TextInputType.numberWithOptions(decimal: true) : TextInputType.text ,
      validator: validator,
      controller: controller,
      cursorColor:const Color.fromARGB(255, 71, 46, 37),

      decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 30),
          hintText: hint,
          hintStyle:const TextStyle(fontSize: 14, fontFamily: "Cairo"),
          suffixIcon: InkWell(onTap: ontapicon,child:Icon(icon,color: AppColor.brown,),),
          border: OutlineInputBorder(
              borderSide:const BorderSide(color: Colors.brown),
              borderRadius: BorderRadius.circular(30)),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          label: Container(
            margin:const EdgeInsets.symmetric(horizontal: 9),
            child: Text(
              text,
              style:const TextStyle(color: Color.fromARGB(255, 71, 46, 37),fontFamily: "Cairo"),
            ),
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide:const BorderSide(width: 2, color: Colors.brown))),
    );
  }
}
