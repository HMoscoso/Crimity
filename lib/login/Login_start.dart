import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../home/home_ciudadano.dart';

class Login_start extends StatelessWidget{
  const Login_start({super.key});

  @override
  Widget build(BuildContext context){
    var height = MediaQuery.of(context).size.height;

    return WillPopScope(
        onWillPop: () async {
          return true;
        },
    child:Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black54,
          ),
        ),
          centerTitle: true,
        ),
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(image: const AssetImage("assets/imgs/logo.PNG"), height: height * 0.10,),
              const SizedBox(height: 40),

              Text(
                'Iniciar Sesion',
                style: GoogleFonts.bebasNeue(
                  fontSize: 52,
                ),
              ),
              const SizedBox(height: 10),
              const Text("Bienvenido. Ingresa tu cuenta"),
              const SizedBox(height: 70),

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
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.email_outlined),
                      border: InputBorder.none,
                      labelText: 'Correo Electronico',
                      hintText: 'ejemplo@hotmail.com',
                    ),
                    validator: (value) {
                      String pattern =
                          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                      RegExp regExp = RegExp(pattern);
                      return regExp.hasMatch(value ?? '')
                          ? null
                          : '    Ingrese un correo valido';
                    },
                  ),
                ),
              ),),
              const SizedBox(height: 20),

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
                      decoration: const InputDecoration(
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
              const SizedBox(height: 40),

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
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=> HomeCiudadanoScreen()));
                },
              ),
              ),
              const SizedBox(height: 15),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    '¿Olvidaste la contraseña?',
                    style: TextStyle(
                      color: Colors.amber,
                      fontWeight: FontWeight.bold,
                    ),),
                ],
              ),
              const SizedBox(height: 20,),

              Row(children: <Widget>[
                Expanded(
                  child: Container(
                      margin: const EdgeInsets.only(left: 25.0, right: 20.0),
                      child: const Divider(
                        color: Colors.black,
                        height: 36,
                      )),
                ),
                const Text("ó continuar con"),
                Expanded(
                  child: Container(
                      margin: const EdgeInsets.only(left: 20.0, right: 25.0),
                      child: const Divider(
                        color: Colors.black,
                        height: 36,
                      )),
                ),
              ]),
              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlinedButton(onPressed: (){},
                      style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(10.0)),
                          foregroundColor: Colors.blue,
                          side: BorderSide(color: Theme.of(context).cardColor),
                          padding: const EdgeInsets.symmetric(vertical: 15.0)
                      ),
                      child: const Icon(FontAwesomeIcons.facebook)),
                  const SizedBox(width: 40.0,),
                  OutlinedButton(
                        onPressed: (){
                        },
                        style: OutlinedButton.styleFrom(
                            elevation: 0,
                            foregroundColor: Colors.red,
                            side: BorderSide(color: Theme.of(context).cardColor),
                            shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(10.0)),
                            padding: const EdgeInsets.symmetric(vertical: 15.0)
                        ),
                  child: const Icon(FontAwesomeIcons.google)),

                ],
              ),
              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '¿No tienes una cuenta?',
                    style: TextStyle(
                      color:  Theme.of(context).accentColor,
                    ),
                  ),
                  const Text(
                      '  Registrate',
                  style: TextStyle(
                    color: Colors.amber,
                    fontWeight: FontWeight.bold,
                  ),),
                ],
              )
            ],
          ),
        ),
      ),
    )
    );
  }
}