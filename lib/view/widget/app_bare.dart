
import 'package:flutter/material.dart';

class CostumAppbare extends StatelessWidget {
  final void Function() doIconLeft;
  final Widget iconLeft;
  final  Widget  iconRight;
  final String title;
  final void Function()? doiconRight;
  const CostumAppbare(
      {super.key,
      required this.doIconLeft,
      this.doiconRight,
      required this.title,
      required this.iconLeft,
      required this.iconRight,
      });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: doIconLeft,
          icon: iconLeft,
        ),
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        IconButton(
            onPressed: doiconRight,
            icon: iconRight
            
            ),
      ],
    );
  }
}
