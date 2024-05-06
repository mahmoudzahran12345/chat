import 'package:chat_app/commonwidget/customtextformfield.dart';
import 'package:chat_app/commonwidget/showdialog.dart';
import 'package:chat_app/logic/login/logincubit.dart';
import 'package:chat_app/screens/register/register.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:chat_app/logic/login/loginstate.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Login extends StatelessWidget {
  Login({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginCubitStates>(
        listener: (context, state) {
          if(state is LoginLoading){
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) {
                return Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ));
              },
            );

          }
          if (state is LoginLoaded) {
                 Navigator.pop(context);

            Navigator.pushNamed(context, "chat");
          }
        },
        builder: (context, state) {

          return Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                backgroundColor: Colors.white,
                centerTitle: true,
                elevation: 0.0,
                title: Text(
                  "تسجيل الدخول ",
                  style: TextStyle(color: Colors.blueAccent, fontSize: 24.sp, fontWeight: FontWeight.w700),
                ),
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Form(
                    key: LoginCubit.get(context).formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                            child: Image.asset(
                          "assets/images/login.png",
                        )),
                        customTextFormField(
                          context: context,
                          title: "البريد الالكتروني",
                          hint: "ادخل البريد الالكتروني",
                          iconRequired: false,
                          controller: LoginCubit.get(context).emailController,
                          validation: (value) {
                            if (value!.isEmpty) {
                              return 'ادخل البريد الالكترونى';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        customTextFormField(
                            context: context,
                            title: "كلمة المرور",
                            hint: "ادخل كلمة المرور",
                            function: () {
                              LoginCubit.get(context).changePasswordVisibility();
                            },
                            suffixIcon: const Icon(Icons.visibility),
                            controller: LoginCubit.get(context).passwordController,
                            validation: (value) {
                              if (value!.isEmpty) {
                                return 'ادخل كلمة المرور ';
                              }
                              return null;
                            },
                            obstructText: LoginCubit.get(context).isPasswordVisible),
                        SizedBox(
                          height: 20.h,
                        ),
                        SizedBox(
                          width: 327.w,
                          height: 55.h,
                          child: ElevatedButton(
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0), side: const BorderSide(color: Colors.tealAccent))),
                                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                                backgroundColor: MaterialStateProperty.all<Color>(Colors.blueAccent),
                              ),
                              onPressed: () {
                                //Navigator.pushNamed(context, "paymentSusscful");
                                if (LoginCubit.get(context).formKey.currentState!.validate()) {
                                  LoginCubit.get(context).userLogin(context);
                                }
                              },
                              child: Text(
                                "تسجيل الدخول",
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              )),
                        ),
                        SizedBox(height: 10.h,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: (){
                                 Navigator.pushNamed(context, "register");
                              },
                              child: Text("انشاء حساب جديد",


                                style: TextStyle(
                                color: Colors.blueAccent,
                                decoration: TextDecoration.underline,decorationColor: Colors.blueAccent,
                                fontWeight: FontWeight.w600,
                                fontSize: 18.sp,

                              ),),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20.h,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
