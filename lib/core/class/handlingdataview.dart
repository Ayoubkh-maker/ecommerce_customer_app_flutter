import 'package:app_ecommerce/core/class/status_request.dart';
import 'package:app_ecommerce/core/constant/app_image.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HandlingDataView extends StatelessWidget {

  final StatusRequest statusRequest ;
  final Widget widget ;
  const HandlingDataView({super.key, required this.statusRequest, required this.widget});

  @override
  Widget build(BuildContext context) {
    return 
       statusRequest == StatusRequest.loading ?  Center(child: Lottie.asset(AppImages.loadingImageJson)  )
      :statusRequest == StatusRequest.failurConnect ?  Center(child: Lottie.asset(AppImages.failurConnectImageJson),)
      :statusRequest == StatusRequest.failurServer ?  Center(child: Lottie.asset(AppImages.failurServerImageJson),)
      :statusRequest == StatusRequest.failure ?  Center(child: Lottie.asset(AppImages.nodataImageJson),) 
      :statusRequest == StatusRequest.failurException ? const Center(child: Text("failur Exception",style: TextStyle(fontSize: 30),),)
      : widget ;
                   
  }
}

class HandlingdataRequest extends StatelessWidget {

  final StatusRequest statusRequest ;
  final Widget widget ;
  const HandlingdataRequest({super.key, required this.statusRequest, required this.widget});

  @override
  Widget build(BuildContext context) {
    return 
       statusRequest == StatusRequest.loading ?  Center(child: Lottie.asset(AppImages.loadingImageJson),)
      :statusRequest == StatusRequest.failurConnect ?  Center(child: Lottie.asset(AppImages.failurConnectImageJson),)
      :statusRequest == StatusRequest.failurServer ?  Center(child: Lottie.asset(AppImages.failurServerImageJson),)
      // :statusRequest == StatusRequest.failurException ? Center(child: Text("failur Exception",style: TextStyle(fontSize: 30),),)
      : widget ;
                   
  }
}