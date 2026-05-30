import 'package:flutter/material.dart';


class CustomDesignCard extends StatelessWidget {
  const CustomDesignCard({super.key});

  @override
  Widget build(BuildContext context) {
    return  Positioned(
                top: 270,
                width: 350,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  // color: AppColor.blueA,
                  child:  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white,
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.white,
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.white,
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.white,
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.white,
                      ),
                    ],
                  ),
                ),
              );
  }
}