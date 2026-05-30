import 'package:app_ecommerce/controller/homescreen_controller.dart';
import 'package:app_ecommerce/view/widget/home/customabottombar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBottombar extends StatelessWidget {
  const CustomBottombar({super.key});
 
  @override
  Widget build(BuildContext context) {
    return  GetBuilder<HomeScreenControllerImp>(builder: (controller)=>BottomAppBar(
      
                color:const Color.fromARGB(255, 19, 60, 61),
                // color: Colors.white,
                
                height: 70,
                shape:  const CircularNotchedRectangle(),
                notchMargin: 10,
                child: Row(
                  children: [
                    ...List.generate(controller.list.length + 1,
                        (index) {
                          int i = index>2 ? index - 1 : index ;
                       return
                        
                          index == 2  ? const Spacer() : CostumbottomBar(
                          onPressed: () { controller.changePage(i); },
                          // text: controller.listName[i],
                          icon: controller.listIcons[i],
                          active: controller.currentPage == i ? true : false,
                        );
                        }
                        )
                    // Row(
                    //   children: [
                        // CostumbottomBar(
                        //   onPressed: () { controller.changePage(0); },
                        //   text: "Home",
                        //   icon: Icons.home,
                        //   active: controller.currentPage == 0 ? true : false,
                        // ),
                    //     CostumbottomBar(
                    //       onPressed: (){controller.changePage(1);} ,
                    //       text: "Search",
                    //       icon: Icons.search_outlined,
                    //        active: controller.currentPage == 1 ? true : false,
                          
                    //     ),
                    //   ],
                    // ),
                    // const Spacer(),
                    // Row(
                    //   children: [
                    //     CostumbottomBar(
                    //       onPressed: (){controller.changePage(2);} ,
                    //       text: "Favorites",
                    //       icon: Icons.favorite,
                    //       active: controller.currentPage == 2 ? true : false,
                    //     ),
                    //     CostumbottomBar(
                    //       onPressed: (){controller.changePage(3);} ,
                    //       text: "profile",
                    //       icon: Icons.person,
                    //       active: controller.currentPage == 3 ? true : false,
                    //     ),
                    //   ],
                    // ),
                  ],
                ),
              ));
  }
}