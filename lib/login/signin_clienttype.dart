import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:getwidget/getwidget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'Login_start.dart';



class SgInClientScreen extends StatelessWidget{
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
                    'Tipo de Cliente',
                    style: GoogleFonts.bebasNeue(
                      fontSize: 45,
                    ),
                  ),
                  SizedBox(height: 50,),


                  Padding(padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child:MaterialButton(
                      elevation: 0.0,
                      minWidth: 400.0,
                      height: 200.0,
                      color: Color(0xFFFFEB80),
                      shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(20.0)),
                      child: Image.asset('assets/imgs/ciudadano.png', height: height*0.15,),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context){
                          return Login_start();
                        },));},
                    ),
                  ),
                  SizedBox(height: 15,),

                  Padding(padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child:MaterialButton(
                      elevation: 0.0,
                      minWidth: 400.0,
                      height: 200.0,
                      color: Color(0xFF9D9A99),
                      shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(20.0)),
                      child: Image.asset('assets/imgs/policia.png', height: height*0.15,),
                      onPressed: () {},
                    ),
                  ),
                  SizedBox(height: 30,),


                  Text("* Si su eleccion es el de usuario “Policia” debera ", style: TextStyle(
                    fontSize: 12.0,
                    color: Theme.of(context).highlightColor,),),
                  Text("identificarse con el Carnet de Identificacion Personal", style: TextStyle(
                    fontSize: 12.0,
                    color: Theme.of(context).highlightColor,),),
                  Text("(CIP) de policia y un PIN de identificacion.", style: TextStyle(
                    fontSize: 12.0,
                    color: Theme.of(context).highlightColor,),),
                  SizedBox(height: 30,),

                  Padding(padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child:MaterialButton(
                      elevation: 0.0,
                      minWidth: 400.0,
                      height: 50.0,
                      color: Theme.of(context).primaryColor,
                      shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(10.0)),
                      child: const Text(
                        'Siguiente',
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


                ],
              ),
            )
        )
    );
  }
}