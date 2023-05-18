import 'dart:convert';
import 'package:crimityapp/login/forgotpwd.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'dart:io';

import '../home/home_ciudadano.dart';

class Login_start extends StatefulWidget{
  const Login_start({super.key});

  @override
  State<Login_start> createState() => _Login_startState();
}

class _Login_startState extends State<Login_start> {

  late Map data;
  late List usersData;

  final TextEditingController correoController = TextEditingController();
  final TextEditingController contraseniaController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  buscarUsuario(var email, String password) async {

    String urlstr = 'http://192.168.100.4:4000/users/get/'+ email.toString() + '/' + password;
    print(email);
    print(urlstr);
    var url = Uri.parse(urlstr);
    http.Response response =  await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    data = json.decode(response.body);
    print(data);


    if (response.body !="{}"){
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=> HomeCiudadanoScreen()));
      retornarId(data["userId"]);
    } else {
      correoController.text = "";
      contraseniaController.text = "";

      Widget okButton = TextButton(
        child: Text("OK"),
        style: TextButton.styleFrom(primary: Colors.deepOrange),
        onPressed: () => Navigator.pop(context),
      );

      // set up the AlertDialog
      AlertDialog alert = AlertDialog(
        title: Text("Error"),
        content: Text("Has ingresado un correo o contraseña incorrecto."),
        actions: [
          okButton,
        ],
      );

      showDialog(
          context: context,
          builder: (BuildContext context) {
            return alert;
          });
    }


  }
  retornarId(var id) async {}

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
        child: Form(
          key: _formKey,
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
                      controller: correoController,
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
                        controller: contraseniaController,
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

                    if (_formKey.currentState!.validate()) {

                      buscarUsuario(correoController.text, contraseniaController.text);

                    }

                    },

                ),
                ),
                const SizedBox(height: 15),

                InkWell(
                  onTap: () {    Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ForgotpwdLogin()));},

                  child: new Text(
                    '¿Olvidaste la contraseña?',
                    style: TextStyle(
                      color: Colors.amber,
                      fontWeight: FontWeight.bold,
                    ),),
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
      ),
    )
    );
  }
}