import 'package:flutter/material.dart';
import 'constant.dart';
import 'size_config.dart';

class FormButton extends StatelessWidget {
  const FormButton({
    super.key,
    required this.text,
    required this.press,
  });
  final String text;
  final void Function() press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        width: double.infinity,
        height: getProportionateScreenHeight(44),
        decoration: BoxDecoration(
          color: darkOrange,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
