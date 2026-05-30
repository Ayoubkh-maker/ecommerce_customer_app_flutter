
import 'package:flutter/widgets.dart';

class CustomTextPayemnt extends StatelessWidget {
  final String title ;
  final double top ;
  final double bottom ;
  const CustomTextPayemnt({super.key, required this.top, required this.bottom, required this.title});

  @override
  Widget build(BuildContext context) {
    return  Container(
                margin:   EdgeInsets.only(top: top, bottom: bottom),
                child:  Text(
                  title,
                  style: const TextStyle(fontSize: 16),
                ),
              );
  }
}