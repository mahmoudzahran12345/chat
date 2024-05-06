// ignore_for_file: prefer_const_constructors

import 'package:chat_app/screens/chat/chat.dart';
import 'package:chat_app/screens/login/login.dart';
import 'package:chat_app/screens/register/register.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


const String register = 'register';
const String login = 'login';
const String chat = 'chat';




Route<dynamic> controller(RouteSettings settings) {
  switch (settings.name) {
    case login:
      return MaterialPageRoute(builder: (context) =>  Login());
    case register:
      return MaterialPageRoute(builder: (context) => Register());
    case chat:
      return MaterialPageRoute(builder: (context) => Chats());


    default:
    // return MaterialPageRoute(builder: (_) => const Splash());
      throw ('Route not found');
  }
}
