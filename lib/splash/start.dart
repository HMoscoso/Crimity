import 'dart:async';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:crimityapp/login/login.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';


class StartScreen extends StatelessWidget{
  const StartScreen({super.key});


  startTimer(){
    var duration = Duration(seconds:4);
    return Timer(duration, LoginScreen() as void Function());
  }

  Widget build(BuildContext context){
    return Container(
        decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
        colors: [Color(0xFFFFD700), Colors.white])),
    child: Scaffold(
    backgroundColor: Colors.transparent,
    body: Center(child: content()),
    ),
    );
  }
  @override
  Widget content() {
    return Container(
      child: Lottie.network('https://assets5.lottiefiles.com/packages/lf20_zpdtmajt.json'),
    );
  }
}