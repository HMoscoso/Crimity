import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:getwidget/getwidget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../home/home_ciudadano.dart';



class Login_start extends StatelessWidget{
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
              Image(image: AssetImage("assets/imgs/logo.PNG"), height: height * 0.10,),
              SizedBox(height: 40,),

              Text(
                'Iniciar Sesion',
                style: GoogleFonts.bebasNeue(
                  fontSize: 52,
                ),
              ),
              SizedBox(height: 10,),
              Text("Bienvenido. Ingresa tu cuenta"),
              SizedBox(height: 70,),

              Padding(padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Form(
                  autovalidateMode: AutovalidateMode.onUserInteraction,

                  child: TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email_outlined),
                      border: InputBorder.none,
                      labelText: 'Correo Electronico',
                      hintText: 'ejemplo@hotmail.com',
                    ),
                    validator: (value) {
                      String pattern =
                          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                      RegExp regExp = new RegExp(pattern);
                      return regExp.hasMatch(value ?? '')
                          ? null
                          : '    Ingrese un correo valido';
                    },
                  ),
                ),
              ),),
              SizedBox(height: 20,),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Form(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: TextFormField (
                      obscureText: true,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.password),
                        border: InputBorder.none,
                        labelText: 'Contraseña',
                        hintText: '********',
                      ),
                      validator: (value) {
                        return (value != null && value.length >= 6)
                            ? null
                            : '    La contraseña debe ser mayor o igual a 6 caracteres';
                      },
                    ),
                  ),
                ),),
              SizedBox(height: 40,),

              Padding(padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child:MaterialButton(
                elevation: 0.0,
                minWidth: 400.0,
                height: 50.0,
                color: Theme.of(context).primaryColor,
                shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(10.0)),
                child: const Text(
                  'Iniciar Sesion',
                  style: TextStyle(
                      color: Color(0xFF212121),
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0
                  ),
                ),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, 'homeciudadano');},
              ),
              ),
              SizedBox(height: 15,),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '¿Olvidaste la contraseña?',
                    style: TextStyle(
                      color: Colors.amber,
                      fontWeight: FontWeight.bold,
                    ),),
                ],
              ),
              SizedBox(height: 20,),

              Row(children: <Widget>[
                Expanded(
                  child: new Container(
                      margin: const EdgeInsets.only(left: 25.0, right: 20.0),
                      child: Divider(
                        color: Colors.black,
                        height: 36,
                      )),
                ),
                Text("ó continuar con"),
                Expanded(
                  child: new Container(
                      margin: const EdgeInsets.only(left: 20.0, right: 25.0),
                      child: Divider(
                        color: Colors.black,
                        height: 36,
                      )),
                ),
              ]),
              SizedBox(height: 20,),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlinedButton(onPressed: (){},
                      style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(10.0)),
                          foregroundColor: Colors.blue,
                          side: BorderSide(color: Theme.of(context).cardColor),
                          padding: EdgeInsets.symmetric(vertical: 15.0)
                      ),
                      child:Icon(FontAwesomeIcons.facebook)),
                  const SizedBox(width: 40.0,),
                  OutlinedButton(
                        onPressed: (){
                        },
                        style: OutlinedButton.styleFrom(
                            elevation: 0,
                            foregroundColor: Colors.red,
                            side: BorderSide(color: Theme.of(context).cardColor),
                            shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(10.0)),
                            padding: EdgeInsets.symmetric(vertical: 15.0)
                        ),
                  child:Icon(FontAwesomeIcons.google)),

                ],
              ),
              SizedBox(height: 20,),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '¿No tienes una cuenta?',
                    style: TextStyle(
                      color:  Theme.of(context).accentColor,
                    ),
                  ),
                  Text(
                      '  Registrate',
                  style: TextStyle(
                    color: Colors.amber,
                    fontWeight: FontWeight.bold,
                  ),),
                ],
              )
            ],
          ),
        )
      )
    );
  }
}