import 'package:crimityapp/prediccion_delito/prediccion_bargraph.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:getwidget/getwidget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'bar graph/bar_graph.dart';



class CrimePredictScreen extends StatelessWidget{
  List<double> weeklySummary = [
    4.40,
    2.50,
    42.42,
    10.50,
    100.20,
    88.99,
  ];
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
                    'Prediccion de Delitos.',
                    style: GoogleFonts.bebasNeue(
                      fontSize: 30,
                    ),
                  ),
                  SizedBox(height: 50,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Por favor, complete los siguientes campos. Los',
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
                        'campos requeridos estan ',
                        style: TextStyle(
                          color:  Theme.of(context).accentColor,
                        ),
                      ),
                      Text(
                        'marcados *.',
                        style: TextStyle(
                          color: Colors.red,
                        ),),
                    ],
                  ),
                  SizedBox(height: 40,),



                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(width: 23.0,),
                      new Flexible(
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
                                border: InputBorder.none,
                                hintText: 'Provincia  ',
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10.0,),
                      new Flexible(
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
                                border: InputBorder.none,
                                hintText: 'Distrito',
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 23.0,),

                    ],
                  ),
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
                            prefixIcon: Icon(FontAwesomeIcons.house),
                            border: InputBorder.none,
                            hintText: 'Direccion',
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
                            prefixIcon: Icon(Icons.book),
                            border: InputBorder.none,
                            hintText: 'Codigo Postal',
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
                            prefixIcon: Icon(Icons.folder),
                            border: InputBorder.none,
                            hintText: 'Tipo de Delito',
                          ),
                        ),
                      ),
                    ),),
                  SizedBox(height: 15,),


                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(width: 23.0,),
                      new Flexible(
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
                                border: InputBorder.none,
                                hintText: 'Fecha Inicio',
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10.0,),
                      new Flexible(
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
                                border: InputBorder.none,
                                hintText: 'Fecha Final',
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 23.0,),

                    ],
                  ),

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
                      onPressed: () {Navigator.of(context).push(MaterialPageRoute(builder: (context)=> MyBarGraph(weeklySummary: weeklySummary,)));},
                    ),
                  ),
                  SizedBox(height: 15,),


                  SizedBox(height: 20,),


                ],
              ),
            )
        )
    )
    );
  }
}