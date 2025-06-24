import 'package:flutter/material.dart';

class CustomButtonWidget extends StatelessWidget {
  final EdgeInsets? margin;
  final String titleButton;
  final Function()? onPressed;

  const CustomButtonWidget(this.titleButton,
      {super.key,this.onPressed, this.margin});

  @override
  Widget build(BuildContext context) => Container(
    margin: margin,
    child: FilledButton(
        style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all<Color>(
                Color(0xFFF8F8F8)
            ),
            shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                )
            )
        ),
        onPressed: onPressed,
        child: Text(titleButton, style: TextStyle(
            color: Theme.of(context).scaffoldBackgroundColor
        ),)
    ),
  );
}