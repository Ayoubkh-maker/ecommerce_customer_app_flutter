import 'package:flutter/material.dart';

class CustomForgotPassword extends StatelessWidget {
  final void Function() onTap;
  const CustomForgotPassword({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 20),
      alignment: Alignment.centerRight,
      child: InkWell(
        onTap: onTap,
        child: Text(
          "Forget password",
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(fontSize: 14, fontFamily: "Cairo"),
        ),
      ),
    );
  }
}
