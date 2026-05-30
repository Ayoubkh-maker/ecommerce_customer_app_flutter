import 'package:app_ecommerce/controller/orders/archive_controller.dart';
import 'package:app_ecommerce/core/class/handlingdataview.dart';
import 'package:app_ecommerce/core/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widget/orders/archive/CustomDesignCardarchive.dart';

class Archive extends StatelessWidget {
  const Archive({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ArchiveControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Archive ",
          style: TextStyle(color: AppColor.blueA),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          GetBuilder<ArchiveControllerImp>(builder: (controller) {
            return HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: controller.data.length,
                    itemBuilder: (context, index) {
                      return CustomCardArchive(
                        dataPending: controller.data[index],
                      );
                    }));
          }),
        ],
      ),
    );
  }
}
