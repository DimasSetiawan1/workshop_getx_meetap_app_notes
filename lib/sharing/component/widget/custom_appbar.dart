import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget {
  final String title;
  final Widget? startWidget;
  final Widget? endWidget;
  const CustomAppbar(this.title, {super.key,
    this.startWidget, this.endWidget
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      height: Theme.of(context).appBarTheme.toolbarHeight,
      decoration: BoxDecoration(
          color: Theme.of(context).appBarTheme.backgroundColor
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          startWidget ?? SizedBox.shrink(),
          Text(title),
          endWidget ?? SizedBox.shrink(),
        ],
      ),
    );
  }
}