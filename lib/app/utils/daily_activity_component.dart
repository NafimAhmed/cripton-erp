import 'package:flutter/material.dart';

class DailyActivityComponent extends StatelessWidget {
  final Color itemColor;
  final double? titleTextSize;
  final double? valueTextSize;
  final double width;
  final double height;
  final String title;
  final String value;

  const DailyActivityComponent(
      {super.key,
      required this.width,
      required this.height,
      required this.title,
      required this.value,
      required this.itemColor,
      this.titleTextSize,
      this.valueTextSize});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(border: Border.all(color: itemColor, width: 1)),
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            width: width,
            height: 0.25 * height,
            decoration: BoxDecoration(color: itemColor),
            child: Text(
              title,
              style: TextStyle(
                  fontSize: titleTextSize ?? 9, // width*0.11,
                  color: Colors.white,
                  fontWeight: FontWeight.w700),
            ),
          ),
          Container(
            alignment: Alignment.center,
            width: width,
            height: 0.70 * height,
            decoration: const BoxDecoration(),
            child: Text(
              value,
              style: TextStyle(
                  fontSize: valueTextSize ?? width * 0.18,
                  color: Colors.black,
                  fontWeight: FontWeight.w700),
            ),
          ),
        ],
      ),
    );
  }
}
