
import 'package:app_ecommerce/core/constant/app_colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomItemsInformation extends StatelessWidget {
  final String image;
  final String name;
  final String price;
  final String count;
  final void Function() onRemove;
  final void Function() onAdd;
  const CustomItemsInformation(
      {super.key,
      required this.name,
      required this.price,
      required this.count,
      required this.image,
      required this.onRemove,
      required this.onAdd});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          border:
              Border(bottom: BorderSide(width: 1, color: AppColor.interface)),
        ),
        padding:const  EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        height: 120,
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Row(
                children: [
                  Expanded(
                      flex: 3,
                      child: Container(
                        decoration: BoxDecoration(
                          border:
                              Border.all(width: 1, color: AppColor.interface),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          // color: Colors.amber,
                        ),
                        child: CachedNetworkImage(imageUrl: image),
                      )),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      flex: 6,
                      child: Container(
                        // color: Colors.grey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              name,
                              style: const TextStyle(fontSize: 20),
                            ),
                            Text(price, style: const TextStyle(fontSize: 17))
                          ],
                        ),
                      )),
                  Expanded(
                      child: Container(
                    // color: Colors.blue,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                            onTap: onAdd,
                            child: const Text(
                              "+",
                              style: TextStyle(fontSize: 20),
                            )),
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Text(
                            count,
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        InkWell(
                            onTap: onRemove,
                            child: const Text(
                              "_",
                              style: TextStyle(fontSize: 20),
                            )),
                      ],
                    ),
                  )),
                ],
              ),
            ),
          ],
        ));
  }
}
