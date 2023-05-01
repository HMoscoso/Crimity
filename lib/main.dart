import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:crimityapp/login/login.dart';
import 'package:crimityapp/prediccion_delito/predicciondelitos.dart';
import 'package:crimityapp/providers/usuario_provider.dart';
import 'package:crimityapp/splash/splash_screen.dart';
import 'package:crimityapp/splash/splash_screen2.dart';
import 'package:crimityapp/splash/splash_screen3.dart';
import 'package:crimityapp/splash/start.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'home/home_ciudadano.dart';
import 'home/home_policia.dart';
import 'login/Login_start.dart';
import 'login/forgotpwd.dart';
import 'login/newpwd.dart';
import 'login/signin.dart';
import 'login/signin_clienttype.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => usuario_provider()),
      ],
      child: MaterialApp(

        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        routes: {
          'login': (context) => LoginScreen(),
          'register':(context) => SigninScreen(),
          'loginst': (context) => Login_start(),
          'homeciudadano':  (context) => HomeCiudadanoScreen(),
        },
        theme: ThemeData(
          primaryColor: const Color(0xFFFFD700),
          accentColor: const Color(0xFF212121),
          highlightColor: const Color(0xFFBCBCBC),
          cardColor: const Color(0xFFF5F5F5),
          primarySwatch: Colors.yellow,
          textTheme: const TextTheme(
            headline1: TextStyle(
              fontSize: 42.0,
              fontWeight: FontWeight.bold,
              color: Color(0xFF212121),
            ),
              headline2: TextStyle(
                fontSize: 35.0,
                fontWeight: FontWeight.bold,
                color: Color(0xFF212121),
              ),
          )
        ),
          splash: StartScreen(),
          splashIconSize: double.infinity,
          nextScreen: SplashScreen(),
          splashTransition: SplashTransition.fadeTransition,
        ),
      ),
    );
  }
}
