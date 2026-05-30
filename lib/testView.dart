// ignore_for_file: file_names

import 'package:app_ecommerce/controller/testController.dart';
import 'package:app_ecommerce/core/class/handlingdataview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TestView extends StatelessWidget {
  const TestView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TestController());

    return Scaffold(
        appBar: AppBar(
          title: const Text('Test View'),
        ),
        body: GetBuilder<TestController>(
          builder: (controller) {
            return HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: ListView.builder(
                  itemCount: controller.data.length,
                  itemBuilder: (context, i) {
                    return Text("${controller.data}");
                  }),
            );
          },
        ));
  }
}
