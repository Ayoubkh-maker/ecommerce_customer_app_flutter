import 'package:app_ecommerce/core/function/check_internet.dart';
import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  initadata()async{
    var res = await checkInternet();
     // ignore: avoid_print
     print(res);

  }
  @override
  void initState() {
    initadata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar:  AppBar(title: const Text("Test"),),


    );
  }
}