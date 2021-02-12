import 'dart:core';

import 'package:flutter/material.dart';
import 'package:robomatic/ChatScreen.dart';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';





void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: "RoboMatic.AI Chatbot",
        //home: new SplashScreen(),
        home: AnimatedSplashScreen(
            duration: 3500,
            splash: "assets/images/roboHead.jpg",
            splashIconSize: 500,
            nextScreen: new MyChatScreen(),
            splashTransition: SplashTransition.sizeTransition,
            pageTransitionType: PageTransitionType.leftToRight,
            backgroundColor: Colors.white70
        )

    );
  }
}