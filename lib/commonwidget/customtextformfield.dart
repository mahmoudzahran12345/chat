import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget customTextFormField(
    {
      required BuildContext context,
      required String title,
      required String hint,
      bool iconRequired = true,
      required TextEditingController controller,
      required  Function validation,
      bool obstructText = false,
      TextInputType inputType = TextInputType.text,
      VoidCallback? function,

      Widget? suffixIcon,
    }) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 7.h),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(color: Colors.black, fontSize: 14.sp, fontWeight: FontWeight.w700),
        ),
        SizedBox(
          height: 5.h,
        ),
        SizedBox(
          width: 327.w,
          child: TextFormField(
            controller: controller,
            obscureText: obstructText,
            style: TextStyle(
              color: Colors.black,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
            ),
            validator: (input) => validation(input),
            decoration: InputDecoration(
              hintText: hint,
              contentPadding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
              hintStyle: TextStyle(
                color: const Color(0xFFCECFD1),
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: const BorderSide(
                  color: Color(0xFFDFE2E6),
                ),
              ),

              suffixIcon: iconRequired ?  GestureDetector(
                  onTap:function,
                  child:obstructText ?  Icon(Icons.visibility ) : Icon(Icons.visibility_off)) :
                  const SizedBox.shrink()
              // filled: true,
              // fillColor: Color(0xFFF5F7FA),
            ),
          ),
        ),
      ],
    ),
  );
}