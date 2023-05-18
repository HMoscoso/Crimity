import 'package:crimityapp/prediccion_delito/prediccion_bargraph.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:getwidget/getwidget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';




class QRScreen extends StatelessWidget{
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
            body: SafeArea(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Aplicacion Crimity',
                        style: GoogleFonts.bebasNeue(
                          fontSize: 35,
                        ),
                      ),
                      Text(
                        'Compartir por QR',
                        style: GoogleFonts.robotoMono(
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(height: 50,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Escanea el codigo QR con otro dispositivo para',
                            style: TextStyle(
                              color:  Theme.of(context).accentColor,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'conectarte y descargar.',
                            style: TextStyle(
                              color:  Theme.of(context).accentColor,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 40,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(image: AssetImage("assets/imgs/QR.png"), height: height * 0.35,),


                        ],
                  ),
                  ]
                )

            )
        )
    )
    );
  }
}