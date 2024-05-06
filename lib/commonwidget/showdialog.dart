import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'customButton.dart';

Widget customShowDialog( { required BuildContext context,required String title}){
  return AlertDialog(
    content: SizedBox(
      height: 200.h,
      child: Column(
        children: [
          Icon(
            Icons.error,
            color: Colors.redAccent,
            size: 60.sp,
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            textAlign: TextAlign.center,
            title,
            style: TextStyle(color: Colors.redAccent, fontSize: 20.sp, fontWeight: FontWeight.w400),
          ),
          Spacer(),
          CustomButton(
            height: 50.h,
            function: (){
              Navigator.pop(context);
            },
            text: "الغاء",
            width: 200.w,
            backgroudColor: Colors.redAccent,
          )
        ],
      ),
    ),
  );
}