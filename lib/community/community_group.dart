import 'package:crimityapp/map/map.dart';
import 'package:crimityapp/shareqr.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../map/ui/pages/home/home_page.dart';
import '../prediccion_delito/predicciondelitos.dart';
import '../profile/profile_screen.dart';

class CommunityGroupScreen extends StatelessWidget{
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

            backgroundColor: Color(0xFFF5F5F5),
            resizeToAvoidBottomInset: false,
            body: SafeArea(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 30),
                      Row(children: <Widget>[
                        SizedBox(width: 50.0,),
                        Text(
                          'Nombre del grupo ',
                          style: GoogleFonts.robotoMono(
                            fontSize: 20,
                          ),
                        ),
                      ],),

                  const SizedBox(height: 15,),
                      Padding(padding: const EdgeInsets.symmetric(horizontal: 50.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.only(left: 20.0),

                            child: TextField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Nombre del Grupo',
                              ),
                            ),
                          ),
                        ),),
                      const SizedBox(height: 20),
                      Row(children: <Widget>[
                        SizedBox(width: 50.0,),
                        Text(
                          'Elegir privacidad.',
                          style: GoogleFonts.robotoMono(
                            fontSize: 20,
                          ),
                        ),
                      ],),
                      const SizedBox(height: 20),
                      Padding(padding: const EdgeInsets.symmetric(horizontal: 50.0),
                        child: OutlinedButton(
                          onPressed: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=> CrimePredictScreen()));},
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
                            SizedBox(width: 120),
                            Text('Privado', style: TextStyle(color: Theme.of(context).accentColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 17.0),),
                          ],
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                      Padding(padding: const EdgeInsets.symmetric(horizontal: 50.0),
                        child: OutlinedButton(
                          onPressed: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=> CrimePredictScreen()));},
                          style: OutlinedButton.styleFrom(
                              elevation: 0,
                              foregroundColor: Theme.of(context).primaryColor,
                              backgroundColor: Colors.white,
                              side: BorderSide(color: Colors.white),
                              shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(14.0)),
                              padding: EdgeInsets.symmetric(vertical: 15.0)
                          ),
                          child:
                          Row(children: <Widget>[
                            SizedBox(width: 120),
                            Text('Publico', style: TextStyle(color: Theme.of(context).accentColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 17.0),),
                          ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
                      const SizedBox(height: 20),
                      Row(children: <Widget>[
                        SizedBox(width: 50.0,),
                        Text(
                          'Invitar a la comunidad',
                          style: GoogleFonts.robotoMono(
                            fontSize: 20,
                          ),
                        ),
                      ],),



                      const SizedBox(height: 30),


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
                            Icon(FontAwesomeIcons.userGroup),
                            SizedBox(width: 30),
                            Text('Scarlet', style: TextStyle(color: Theme.of(context).accentColor,
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
                            Icon(FontAwesomeIcons.userGroup),
                            SizedBox(width: 30),
                            Text('Rebecca', style: TextStyle(color: Theme.of(context).accentColor,
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
                            Icon(FontAwesomeIcons.userGroup),
                            SizedBox(width: 30),
                            Text('Juan Pablo', style: TextStyle(color: Theme.of(context).accentColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 17.0),),
                          ],
                          ),
                        ),
                      ),
                      SizedBox(height: 30,),

                      Padding(padding: const EdgeInsets.symmetric(horizontal: 50.0),
                        child:MaterialButton(
                          elevation: 0.0,
                          minWidth: 400.0,
                          height: 50.0,
                          color: Theme.of(context).primaryColor,
                          shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(10.0)),
                          child: const Text(
                            'Crear Grupo',
                            style: TextStyle(
                                color: Color(0xFF212121),
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0
                            ),
                          ),
                          onPressed: () {},
                        ),
                      ),


                    ],
                  ),
                )
            )
        )
    );
  }
}
