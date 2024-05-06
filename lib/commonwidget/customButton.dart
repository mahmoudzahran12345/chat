// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final double height;
  final double width;
  final VoidCallback function;
  final String text;
  final double? size;
  final IconData? iconData;
  final FontWeight? fontWeight;
  final Color? backgroudColor;
  final Color? textColor;

  const CustomButton({
    super.key,
    required this.height,
    required this.function,
    this.fontWeight,
    required this.text,
    required this.width,
    this.size,
    this.iconData,
    this.backgroudColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0.r),
        color: backgroudColor ?? Colors.blueAccent,
      ),
      child: MaterialButton(
        onPressed: function,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            iconData == null
                ? SizedBox.shrink()
                : Icon(
              iconData,
              size: 13.sp,
              color: Colors.white,
            ),
            Text(
              text,
              style: TextStyle(
                color: textColor ?? Colors.white,
                fontSize: size,
                fontWeight: FontWeight.w600,

              ),
            ),
          ],
        ),
      ),
    );
  }
}
