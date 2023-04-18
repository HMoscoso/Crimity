import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:getwidget/getwidget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';



class HomeCiudadanoScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Color(0xFFF5F5F5),
        body: SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(children: <Widget>[
                    SizedBox(width: 50.0,),
                    Text(
                      'Hola, ',
                      style: GoogleFonts.robotoMono(
                        fontSize: 30,
                      ),
                    ),
                    Image.asset("assets/imgs/handemoji.png", height: height * 0.05 )
                  ],),
                  

                  SizedBox(height: 30,),

                  Padding(padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child:MaterialButton(
                      elevation: 0.0,
                      minWidth: 300.0,
                      height: 150.0,
                      color: Color(0xFFD8D7D6),
                      shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(20.0)),
                      child: Image.asset('assets/imgs/ubicacion.png', height: height*0.10,),
                      onPressed: () {},
                    ),
                  ),
                  SizedBox(height: 50,),

                  Padding(padding: const EdgeInsets.symmetric(horizontal: 50.0),
                    child: OutlinedButton(
                        onPressed: (){},
                        style: OutlinedButton.styleFrom(
                            elevation: 0,
                            foregroundColor: Theme.of(context).primaryColor,
                            backgroundColor: Colors.white,
                            side: BorderSide(color: Colors.white),
                            shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(10.0)),
                            padding: EdgeInsets.symmetric(vertical: 15.0)
                        ),
                        child:
                        Row(children: <Widget>[
                          SizedBox(width: 20),
                          Icon(FontAwesomeIcons.filePen),
                          SizedBox(width: 30),
                          Text('Prediccion de Delitos.', style: TextStyle(color: Theme.of(context).accentColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 17.0),),
                        ],
                        ),
                    ),
                  ),
                  SizedBox(height: 20,),

                  Padding(padding: const EdgeInsets.symmetric(horizontal: 50.0),
                    child: OutlinedButton(
                      onPressed: (){},
                      style: OutlinedButton.styleFrom(
                          elevation: 0,
                          foregroundColor: Color(0xFF4C4543),
                          backgroundColor: Colors.white,
                          side: BorderSide(color: Colors.white),
                          shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(10.0)),
                          padding: EdgeInsets.symmetric(vertical: 15.0)
                      ),
                      child:
                      Row(children: <Widget>[
                        SizedBox(width: 20),
                        Icon(FontAwesomeIcons.vrCardboard),
                        SizedBox(width: 30),
                        Text('Alertas.', style: TextStyle(color: Theme.of(context).accentColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 17.0),),
                      ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),

                  Padding(padding: const EdgeInsets.symmetric(horizontal: 50.0),
                    child: OutlinedButton(
                      onPressed: (){},
                      style: OutlinedButton.styleFrom(
                          elevation: 0,
                          foregroundColor: Theme.of(context).primaryColor,
                          backgroundColor: Colors.white,
                          side: BorderSide(color: Colors.white),
                          shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(10.0)),
                          padding: EdgeInsets.symmetric(vertical: 15.0)
                      ),
                      child:
                      Row(children: <Widget>[
                        SizedBox(width: 20),
                        Icon(FontAwesomeIcons.phone),
                        SizedBox(width: 30),
                        Text('Registrar solicitud.', style: TextStyle(color: Theme.of(context).accentColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 17.0),),
                      ],
                      ),
                    ),
                  ),

                  SizedBox(height: 80,),

                  
                  SizedBox(height: 15,),
                ],
              ),
            )
        )
    );
  }
}