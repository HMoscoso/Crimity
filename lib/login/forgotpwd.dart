import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:getwidget/getwidget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'newpwd.dart';



class ForgotpwdLogin extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '¿Olvidaste tu contraseña?',
                    style: GoogleFonts.bebasNeue(
                      fontSize: 35,
                    ),
                  ),
                  SizedBox(height: 30,),

                  Image(image: AssetImage("assets/imgs/forgotpwd.PNG"), height: height * 0.22,),
                  SizedBox(height: 30,),



                  Text("Selecciona una de las opciones que usaras para  ", style: TextStyle(
                    fontSize: 12.0,
                    color: Theme.of(context).accentColor,),),
                  Text("restablecer tu contraseña.", style: TextStyle(
                    fontSize: 12.0,
                    color: Theme.of(context).accentColor,),),
                  SizedBox(height: 30,),

                  Padding(padding: const EdgeInsets.symmetric(horizontal: 50.0),
                    child:OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(20.0)),
                          foregroundColor: Colors.blue,
                          side: BorderSide(color: Theme.of(context).primaryColor),
                          padding: EdgeInsets.symmetric(vertical: 15.0)
                      ),
                      child: Row(children: <Widget>[
                        SizedBox(width: 20),
                        Image.asset('assets/imgs/sms.PNG', height: height * 0.13,),
                        SizedBox(width: 30),
                        Text('Telefono movil.', style: TextStyle(color: Theme.of(context).accentColor,),),
                      ],
                      ),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context){
                          return NewpwdLogin();
                        },));},
                    ),
                  ),
                  SizedBox(height: 15,),

                  Padding(padding: const EdgeInsets.symmetric(horizontal: 50.0),
                    child:OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(20.0)),
                          foregroundColor: Colors.blue,
                          side: BorderSide(color: Theme.of(context).cardColor),
                          padding: EdgeInsets.symmetric(vertical: 15.0)
                      ),
                      child: Row(children: <Widget>[
                        SizedBox(width: 20),
                        Image.asset('assets/imgs/email.PNG', height: height * 0.13,),
                        SizedBox(width: 30),
                        Text('Email.', style: TextStyle(color: Theme.of(context).accentColor,),),
                      ],
                      ),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context){
                          return NewpwdLogin();
                        },));},
                    ),
                  ),
                  SizedBox(height: 15,),



                  Padding(padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child:MaterialButton(
                      elevation: 0.0,
                      minWidth: 400.0,
                      height: 50.0,
                      color: Theme.of(context).primaryColor,
                      shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(10.0)),
                      child: const Text(
                        'Continuar',
                        style: TextStyle(
                            color: Color(0xFF212121),
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context){
                          return NewpwdLogin();
                        },));},
                    ),
                  ),
                  SizedBox(height: 15,),


                ],
              ),
            )
        )
    );
  }
}