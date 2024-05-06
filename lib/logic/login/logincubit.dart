import 'package:bloc/bloc.dart';
import 'package:chat_app/commonwidget/customButton.dart';
import 'package:chat_app/commonwidget/showdialog.dart';
import 'package:chat_app/logic/login/loginstate.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginCubit extends Cubit<LoginCubitStates> {
  LoginCubit() : super(LoginInitial());

  static LoginCubit get(context) => BlocProvider.of(context);

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  GlobalKey<FormState> formKeyRegister = GlobalKey<FormState>();


  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailControllerRegister = TextEditingController();
  TextEditingController passwordControllerRegister = TextEditingController();

  bool isPasswordVisible = false;

  void changePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    emit(ChangePasswordIcon());
  }

  void userLogin(BuildContext context) async {
    emit(LoginLoading());
    try {
      UserCredential user = await FirebaseAuth.instance.signInWithEmailAndPassword(email: emailController.text.trim(), password: passwordController.text.trim());
      emit(LoginLoaded());
      Fluttertoast.showToast(msg: "تم الدخول بنجاح", toastLength: Toast.LENGTH_LONG, gravity: ToastGravity.CENTER, timeInSecForIosWeb: 1, backgroundColor: Colors.green, textColor: Colors.white, fontSize: 16.0);

    } on FirebaseAuthException catch (ex) {
      if (ex.code == "user-not-found") {
        Navigator.pop(context);
        showDialog(
            context: context,
            builder: (ctx) => customShowDialog(
                  context: context,
                  title: "المستخدم غير موجود",
                ));
      } else if (ex.code == "wrong-password") {
        Navigator.pop(context);

        showDialog(context: context, builder: (ctx) => customShowDialog(context: context, title: "كلمة المرور غير صحيحة"));
      }
       else {
        Navigator.pop(context);

        showDialog(context: context, builder: (ctx) => customShowDialog(context: context, title: "حدث خطا ما حاول مرة اخره"));
      }
      emit(LoginError(error: ex.code));
    }
  }



  void userRegister(BuildContext context) async {
    emit(RegisterLoading());
    try {
      UserCredential user = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailControllerRegister.text.trim(), password: passwordControllerRegister.text.trim());
      emit(RegisterLoaded());
      Fluttertoast.showToast(msg: "تم التسجيل بنجاح", toastLength: Toast.LENGTH_LONG, gravity: ToastGravity.CENTER, timeInSecForIosWeb: 1, backgroundColor: Colors.green, textColor: Colors.white, fontSize: 16.0);

    } on FirebaseAuthException catch (ex) {
      if (ex.code == "weak-password") {
        Navigator.pop(context);

        showDialog(
            context: context,
            builder: (ctx) => customShowDialog(
              context: context,
              title: "كلمة المرور يجب ان تكون مكونة من 6 احرف",
            ));
      } else if (ex.code == "email-already-in-use") {
        Navigator.pop(context);

        showDialog(context: context, builder: (ctx) => customShowDialog(context: context, title: "البريد الالكتروني مستخدم من قبل"));
      } else if (ex.code == "invalid-email") {
        Navigator.pop(context);

        showDialog(context: context, builder: (ctx) => customShowDialog(context: context, title: "ادخل البريد الالكتروني بشكل صحيح"));
      } else {
        Navigator.pop(context);

        showDialog(context: context, builder: (ctx) => customShowDialog(context: context, title: "حدث خطا ما حاول مرة اخره"));
      }
      emit(RegisterError(error: ex.code));
    }
  }
}
