import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';



class SigninScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        body: SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
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
                      child: const Padding(
                        padding: EdgeInsets.only(left: 20.0),

                        child: TextField(
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
                      child: const Padding(
                        padding: EdgeInsets.only(left: 20.0),

                        child: TextField(
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
                      child: const Padding(
                        padding: EdgeInsets.only(left: 20.0),

                        child: TextField(
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
                      child: const Padding(
                        padding: EdgeInsets.only(left: 20.0),
                        child: TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.password),
                            border: InputBorder.none,
                            hintText: 'Password',
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
                      onPressed: () {

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
                  )
                ],
              ),
            )
        )
    );
  }
}