import 'package:app_ecommerce/controller/search_controller.dart';

import 'package:app_ecommerce/core/class/handlingdataview.dart';

import 'package:app_ecommerce/view/widget/search/custom_input_simple.dart';
import 'package:app_ecommerce/view/widget/search/listItemsSearch.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Recherche extends StatelessWidget {
  const Recherche({super.key});

  @override
  Widget build(BuildContext context) {
  SearchControllerImp controllerSear = Get.put(SearchControllerImp());
    return Scaffold(
        body: SafeArea(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              children: [
              
              CustomInputSimple(onsearch: () {
                controllerSear.searchItems();
              }, controllerSearch: controllerSear.search,),


               GetBuilder<SearchControllerImp>(builder: (controller){
                return HandlingDataView(statusRequest: controller.statusRequest, widget:
                const ListSearchItems()
                
                );
               })
              ],
            ),
          ));
    }
  }
  