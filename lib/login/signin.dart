import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:getwidget/getwidget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';



class SigninScreen extends StatelessWidget{
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
                  SizedBox(height: 30,),

                  Text(
                    'Crear una cuenta',
                    style: GoogleFonts.bebasNeue(
                      fontSize: 45,
                    ),
                  ),
                  SizedBox(height: 50,),

                  Padding(padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),

                        child: TextField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.person),
                            border: InputBorder.none,
                            hintText: 'Nombre Completo',
                          ),
                        ),
                      ),
                    ),),
                  SizedBox(height: 15,),

                  Padding(padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),

                        child: TextField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.email_outlined),
                            border: InputBorder.none,
                            hintText: 'Correo Electronico',
                          ),
                        ),
                      ),
                    ),),
                  SizedBox(height: 15,),

                  Padding(padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),

                        child: TextField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.phone),
                            border: InputBorder.none,
                            hintText: 'Numero Telefonico',
                          ),
                        ),
                      ),
                    ),),
                  SizedBox(height: 15,),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
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
                  SizedBox(height: 30,),

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
                      onPressed: () {},
                    ),
                  ),
                  SizedBox(height: 15,),

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
                          onPressed: (){},
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
                        '¿Ya tienes una cuenta?',
                        style: TextStyle(
                          color:  Theme.of(context).accentColor,
                        ),
                      ),
                      Text(
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