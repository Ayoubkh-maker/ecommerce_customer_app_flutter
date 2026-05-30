import 'package:app_ecommerce/controller/orders/pending_controller.dart';
import 'package:app_ecommerce/core/class/handlingdataview.dart';
import 'package:app_ecommerce/core/constant/app_colors.dart';
import 'package:app_ecommerce/view/widget/orders/pending/custom_orders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class Pending extends StatelessWidget {
  const Pending({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(PendingControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Orders ",
          style: TextStyle(color: AppColor.blueA),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          GetBuilder<PendingControllerImp>(builder: (controller) {
            return HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: controller.data.length,
                    itemBuilder: (context, index) {
                      return CustomCardPinding(
                        dataPending: controller.data[index],
                      );
                    }));
          }),
        ],
      ),
    );
  }
}
