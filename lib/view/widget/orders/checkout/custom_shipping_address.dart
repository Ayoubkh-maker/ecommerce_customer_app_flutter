import 'package:app_ecommerce/core/constant/app_colors.dart';
import 'package:flutter/material.dart';

class CustomShippingAddress extends StatelessWidget {
  final Function() onTap;
  final String place;
  final String cityStreet;
  final bool changeColor;
  const CustomShippingAddress(
      {super.key,
      required this.changeColor,
      required this.onTap,
      required this.place,
      required this.cityStreet});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: changeColor == true ? 5 : 0,
        margin: const EdgeInsets.only(bottom: 10),
        shadowColor: Colors.black,
        color: changeColor == true ? AppColor.blueA :const Color.fromARGB(255, 252, 228, 228) ,
        child: ListTile(
          title: Text(
            place,
            style: TextStyle(
              color: changeColor == true
                  ? Colors.white
                  : null ,
            ),
          ),
          subtitle: Text(
            cityStreet,
            style: TextStyle(
              color: changeColor == true
                  ? Colors.white
                  : null
            ),
          ),
        ),
      ),
    );
  }
}
