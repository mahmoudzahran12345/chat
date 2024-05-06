import 'package:chat_app/screens/login/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:chat_app/routes/routes.dart' as route;

import 'logic/observe/observe.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyB1lbNELMmVNBXfehR4qkF1oN9L7dgkULE",
          appId: "1:1054379005525:android:c258faf09ee0d3df6d66dc",
          messagingSenderId: "1054379005525",
          projectId: "heass-c610b"));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            appBarTheme: const AppBarTheme(
              surfaceTintColor: Colors.transparent,
            ),
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
            fontFamily: "Tajawal"),
        onGenerateRoute: route.controller,
        initialRoute: route.login,
      ),
    );
  }
}
