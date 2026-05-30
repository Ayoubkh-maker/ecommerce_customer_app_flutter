 import 'package:app_ecommerce/controller/orders/archive_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rating_dialog/rating_dialog.dart';


    // show the dialog
void ratingOrder(BuildContext context , orderid){
     
      showDialog(
      context: context,
      barrierDismissible: true, // set to false if you want to force a rating
      builder: (context) =>  RatingDialog(
      initialRating: 1.0,
      // your app's name?
      title:const  Text(
        'Rating Order',
        textAlign: TextAlign.center,
        style:  TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
      // encourage your user to leave a high rating?
      message:const  Text(
        'Tap a star to set your rating. Add more description here if you want.',
        textAlign: TextAlign.center,
        style:  TextStyle(fontSize: 15),
      ),
      // your app's logo?
      image: const FlutterLogo(size: 100),
      submitButtonText: 'Submit',
      commentHint: 'Set your custom comment hint',
      onCancelled: () => print('cancelled'),
      onSubmitted: (response) {
        print('rating: ${response.rating}, comment: ${response.comment}');

      ArchiveControllerImp controllerImp = Get.find();
     controllerImp.submentRating(orderid , response.rating.toDouble() , response.comment.toString());
    
      },
    )

    );
}