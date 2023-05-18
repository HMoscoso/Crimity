import 'package:crimityapp/login/signin_clienttype.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'dart:io';


class SigninScreen extends StatefulWidget{



  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {

  registrarUsuario(String fullName, String email, String phoneNum, String password) async {

    var url = Uri.parse('http://192.168.100.4:4000/users/post');
    var response = await http.post(url,
        body: {
      "fullName": fullName,
      "email": email,
      "phoneNum": phoneNum,
      "password": password
    });
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');


  }

  final TextEditingController nombreController = TextEditingController();
  final TextEditingController correoController = TextEditingController();
  final TextEditingController numeroController = TextEditingController();
  final TextEditingController contraseniaController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  
  
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
          physics: BouncingScrollPhysics(),
            child: Form(
              key: _formKey,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20,),
                    Image(image: const AssetImage("assets/imgs/logo.PNG"), height: height * 0.10,),
                    const SizedBox(height: 30,),

                    Text(
                      'Crear una cuenta',
                      style: GoogleFonts.bebasNeue(
                        fontSize: 45,
                      ),
                    ),
                    const SizedBox(height: 50,),

                    Padding(padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(left: 20.0),

                          child: TextFormField(
                            controller: nombreController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Ingresa tu Nombre completo';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.person),
                              border: InputBorder.none,
                              hintText: 'Nombre Completo',
                            ),
                          ),
                        ),
                      ),),
                    const SizedBox(height: 15,),

                    Padding(padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(left: 20.0),

                          child: TextFormField(
                            controller: correoController,
                            validator: (value) {
                              String pattern =
                                  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                              RegExp regExp = RegExp(pattern);
                              return regExp.hasMatch(value ?? '')
                                  ? null
                                  : '    Ingrese un correo valido';
                            },
                              decoration: InputDecoration(
                              prefixIcon: Icon(Icons.email_outlined),
                              border: InputBorder.none,
                              hintText: 'Correo Electronico',
                            ),
                          ),
                        ),
                      ),),
                    const SizedBox(height: 15,),

                    Padding(padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child:  Padding(
                          padding: EdgeInsets.only(left: 20.0),

                          child: TextFormField(
                            controller: numeroController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Ingresa tu Nombre completo';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.phone),
                              border: InputBorder.none,
                              hintText: 'Numero Telefonico',
                            ),
                          ),
                        ),
                      ),),
                    const SizedBox(height: 15,),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child:  Padding(
                          padding: EdgeInsets.only(left: 20.0),
                          child: TextFormField(
                            controller: contraseniaController,
                            validator: (value) {
                              return (value != null && value.length >= 6)
                                  ? null
                                  : '    La contraseña debe ser mayor o igual a 6 caracteres';
                            },
                            obscureText: true,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.password),
                              border: InputBorder.none,
                              hintText: 'Contraseña',
                            ),
                          ),
                        ),
                      ),),
                    const SizedBox(height: 30,),

                    Padding(padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child:MaterialButton(
                        elevation: 0.0,
                        minWidth: 400.0,
                        height: 50.0,
                        color: Theme.of(context).primaryColor,
                        shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(10.0)),
                        child: const Text(
                          'Registrarse',
                          style: TextStyle(
                              color: Color(0xFF212121),
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0
                          ),
                        ),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            registrarUsuario(
                                nombreController.text, correoController.text,
                                numeroController.text,
                                contraseniaController.text);
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  // Retrieve the text the that user has entered by using the
                                  // TextEditingController.
                                  content: Text("Usuario registrado satisfactoriamente."),

                                );
                              },
                            );
                            sleep(Duration(seconds:3));
                            Navigator.of(context).push(
                                MaterialPageRoute(builder: (context) {
                                  return SgInClientScreen();
                                },));
                          }
                        },
                      ),
                    ),
                    const SizedBox(height: 15,),

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
                    const SizedBox(height: 20,),

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
                            child:const Icon(FontAwesomeIcons.facebook)),
                        const SizedBox(width: 40.0,),
                        OutlinedButton(
                            onPressed: (){},
                            style: OutlinedButton.styleFrom(
                                elevation: 0,
                                foregroundColor: Colors.red,
                                side: BorderSide(color: Theme.of(context).cardColor),
                                shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(10.0)),
                                padding: const EdgeInsets.symmetric(vertical: 15.0)
                            ),
                            child:const Icon(FontAwesomeIcons.google)),

                      ],
                    ),
                    const SizedBox(height: 20,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '¿Ya tienes una cuenta?',
                          style: TextStyle(
                            color:  Theme.of(context).accentColor,
                          ),
                        ),
                        const Text(
                          '  Inicia Sesion',
                          style: TextStyle(
                            color: Colors.amber,
                            fontWeight: FontWeight.bold,
                          ),),
                      ],
                    ),

                    const SizedBox(height: 50,),
                  ],
                ),
              ),
            )
        ),
    ),
    );
  }
}