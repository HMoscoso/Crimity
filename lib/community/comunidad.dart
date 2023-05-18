import 'package:crimityapp/community/community_group.dart';
import 'package:crimityapp/community/post.dart';
import 'package:crimityapp/community/searchdistrit.dart';
import 'package:crimityapp/map/map.dart';
import 'package:crimityapp/shareqr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../map/ui/pages/home/home_page.dart';
import '../prediccion_delito/predicciondelitos.dart';
import '../profile/profile_screen.dart';
import 'distrit.dart';

class CommunityScreen extends StatefulWidget{

  @override
  State<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {


  List<Distrito> _distritos = [
    Distrito('Comunidad Ate Vitarte', '@Distrito de Lima', 'https://upload.wikimedia.org/wikipedia/commons/4/4d/Municipalidad_de_Ate.jpg', false),
    Distrito('Comunidad Pachacamac', '@Distrito de Lima', 'https://viajandoalima.com/wp-content/uploads/2017/12/Pachacamac-Lima.jpg', false),
    Distrito('Comunidad San Borja', '@Distrito de Lima', 'https://blog.nexoinmobiliario.pe/wp-content/uploads/2021/04/san-borja-mejores-lugares-vivir-lima.jpg', false),
    Distrito('Comunidad Villa María del Triunfo', '@Distrito de Lima', 'https://www.religiondigital.org/2020/02/09/diario_de_un_cura_de_pueblo/Villa-Maria-Triunfo-Lima-Sur_2202989681_14313917_660x371.jpg', false),
  ];


  List<Distrito> _foundedDistrits = [];


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
            body: SingleChildScrollView(
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(children: <Widget>[
                        SizedBox(width: 40.0,),
                        Text(
                          'Hola, Hillary',
                          style: GoogleFonts.robotoMono(
                            fontSize: 30,
                          ),
                        ),
                        Image.asset("assets/imgs/handemoji.png", height: height * 0.05 )
                      ],),
                      const SizedBox(height: 30),
                      Row(children: <Widget>[
                        SizedBox(width: 40.0,),
                        Text(
                          'Unete a la comunidad del distrito ',
                            style: TextStyle(
                            color:  Theme.of(context).accentColor,
                              fontSize: 17,
            ),
                        ),
                      ],),
                      Row(children: <Widget>[
                        SizedBox(width: 40.0,),
                        Text(
                          'correspondiente para obtener',
                          style: TextStyle(
                            color:  Theme.of(context).accentColor,
                            fontSize: 17,
                          ),
                        ),
                      ],),
                      Row(children: <Widget>[
                        SizedBox(width: 40.0,),
                        Text(
                          'notificaciones especificas.',
                          style: TextStyle(
                            color:  Theme.of(context).accentColor,
                            fontSize: 17,
                          ),
                        ),
                      ],),
                      const SizedBox(height: 40),
                      Row(children: <Widget>[
                        SizedBox(width: 40.0,),
                        new Flexible(
                        child: new TextField(
                          onTap:
                          () {Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SearchCommunityScreen()));},
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.grey[850],
                              contentPadding: EdgeInsets.all(0),
                              prefixIcon: Icon(Icons.search, color: Colors.grey.shade500,),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none
                              ),
                              hintStyle: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white70
                              ),
                              hintText: "Buscar comunidad"
                          ),
                        ),
                      ),
                        SizedBox(width: 40.0,),
                      ],),

                     //TabBar(tabs: [
                     //  Tab(
                     //    icon: Icon(Icons.grid_3x3_outlined),
                     //  ),
                     //  Tab(
                     //    icon: Icon(Icons.commute_outlined),
                     //  ),
                     //]),

                      const SizedBox(height: 50),

                      GestureDetector(
                        onTap:
                            () {Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PostScreen()));},
                        child: Row(children: <Widget>[

                          SizedBox(width: 20.0,),
                          SizedBox(height: 10.0,),
                          Flexible(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                    children: [
                                      Container(
                                          width: 60,
                                          height: 60,
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(50),
                                            child: Image.network(_distritos.first.image, fit: BoxFit.cover),
                                          )
                                      ),
                                      SizedBox(width: 10),
                                      Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(width: 150,child: Text(_distritos.first.name, style: TextStyle(fontWeight: FontWeight.w500)),),
                                            SizedBox(height: 5,),
                                            Text(_distritos.first.cantidad, style: TextStyle(color: Colors.grey[500])),
                                          ]
                                      )
                                    ]
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _distritos.first.isFollowedByMe = !_distritos.first.isFollowedByMe;
                                    });
                                  },
                                  child: AnimatedContainer(
                                      height: 35,
                                      width: 110,
                                      duration: Duration(milliseconds: 300),
                                      decoration: BoxDecoration(
                                          color: _distritos.first.isFollowedByMe ? Color(0xFFFFD700) : Color(0xffffff),
                                          borderRadius: BorderRadius.circular(5),
                                          border: Border.all(color: _distritos.first.isFollowedByMe ? Colors.transparent : Colors.grey.shade700,)
                                      ),
                                      child: Center(
                                          child: Text(_distritos.first.isFollowedByMe ? 'Miembro' : 'Unirte al Grupo', style: TextStyle(color: _distritos.first.isFollowedByMe ? Colors.white : Colors.black))
                                      )
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(width: 20.0,),
                          SizedBox(height: 10.0,),],),
                      ),


                      SizedBox(height: 20.0,),

                      GestureDetector(
                        onTap:
                            () {Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SearchCommunityScreen()));},
                        child: Row(children: <Widget>[

                          SizedBox(width: 20.0,),
                          SizedBox(height: 10.0,),
                          Flexible(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                    children: [
                                      Container(
                                          width: 60,
                                          height: 60,
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(50),
                                            child: Image.network(_distritos[2].image, fit: BoxFit.cover),
                                          )
                                      ),
                                      SizedBox(width: 10),
                                      Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(width: 150,child: Text(_distritos[2].name, style: TextStyle(fontWeight: FontWeight.w500)),),
                                            SizedBox(height: 5,),
                                            Text(_distritos[2].cantidad, style: TextStyle(color: Colors.grey[500])),
                                          ]
                                      )
                                    ]
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _distritos[2].isFollowedByMe = !_distritos.last.isFollowedByMe;
                                    });
                                  },
                                  child: AnimatedContainer(
                                      height: 35,
                                      width: 110,
                                      duration: Duration(milliseconds: 300),
                                      decoration: BoxDecoration(
                                          color: _distritos[2].isFollowedByMe ? Color(0xFFFFD700) : Color(0xffffff),
                                          borderRadius: BorderRadius.circular(5),
                                          border: Border.all(color: _distritos[2].isFollowedByMe ? Colors.transparent : Colors.grey.shade700,)
                                      ),
                                      child: Center(
                                          child: Text(_distritos[2].isFollowedByMe ? 'Miembro' : 'Unirte al Grupo', style: TextStyle(color: _distritos[2].isFollowedByMe ? Colors.white : Colors.black))
                                      )
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(width: 20.0,),
                          SizedBox(height: 10.0,),],),
                      ),


                      SizedBox(height: 20.0,),

                      GestureDetector(
                        onTap:
                            () {Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SearchCommunityScreen()));},
                        child: Row(children: <Widget>[

                          SizedBox(width: 20.0,),
                          SizedBox(height: 10.0,),
                          Flexible(
                            child:
                            Row(children: <Widget>[
                              Flexible(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                        children: [
                                          Container(
                                              width: 60,
                                              height: 60,
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.circular(50),
                                                child: Image.network(_distritos[1].image, fit: BoxFit.cover),
                                              )
                                          ),
                                          SizedBox(width: 10),
                                          Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(width: 150,child: Text(_distritos[1].name, style: TextStyle(fontWeight: FontWeight.w500)),),
                                                SizedBox(height: 5,),
                                                Text(_distritos[1].cantidad, style: TextStyle(color: Colors.grey[500])),
                                              ]
                                          )
                                        ]
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          _distritos[1].isFollowedByMe = !_distritos[1].isFollowedByMe;
                                        });
                                      },
                                      child: AnimatedContainer(
                                          height: 35,
                                          width: 110,
                                          duration: Duration(milliseconds: 300),
                                          decoration: BoxDecoration(
                                              color: _distritos[1].isFollowedByMe ? Color(0xFFFFD700) : Color(0xffffff),
                                              borderRadius: BorderRadius.circular(5),
                                              border: Border.all(color: _distritos[1].isFollowedByMe ? Colors.transparent : Colors.grey.shade700,)
                                          ),
                                          child: Center(
                                              child: Text(_distritos[1].isFollowedByMe ? 'Miembro' : 'Unirte al Grupo', style: TextStyle(color: _distritos[1].isFollowedByMe ? Colors.white : Colors.black))
                                          )
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(width: 20.0,),
                              SizedBox(height: 10.0,),],),
                      ),
                      ]),
                      ),


                      SizedBox(height: 20.0,),

                      GestureDetector(
                        onTap:
                            () {Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SearchCommunityScreen()));},
                        child: Row(children: <Widget>[

                          SizedBox(width: 20.0,),
                          SizedBox(height: 10.0,),
                          Flexible(
                            child:
                            Row(children: <Widget>[
                              Flexible(
                                child:
                                Row(children: <Widget>[

                                  Flexible(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                            children: [
                                              Container(
                                                  width: 60,
                                                  height: 60,
                                                  child: ClipRRect(
                                                    borderRadius: BorderRadius.circular(50),
                                                    child: Image.network(_distritos.last.image, fit: BoxFit.cover),
                                                  )
                                              ),
                                              SizedBox(width: 10),
                                              Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    SizedBox(width: 150,child: Text(_distritos.last.name, style: TextStyle(fontWeight: FontWeight.w500)),),
                                                    SizedBox(height: 5,),
                                                    Text(_distritos.last.cantidad, style: TextStyle(color: Colors.grey[500])),
                                                  ]
                                              )
                                            ]
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              _distritos.last.isFollowedByMe = !_distritos.last.isFollowedByMe;
                                            });
                                          },
                                          child: AnimatedContainer(
                                              height: 35,
                                              width: 110,
                                              duration: Duration(milliseconds: 300),
                                              decoration: BoxDecoration(
                                                  color: _distritos.last.isFollowedByMe ? Color(0xFFFFD700) : Color(0xffffff),
                                                  borderRadius: BorderRadius.circular(5),
                                                  border: Border.all(color: _distritos.last.isFollowedByMe ? Colors.transparent : Colors.grey.shade700,)
                                              ),
                                              child: Center(
                                                  child: Text(_distritos.last.isFollowedByMe ? 'Miembro' : 'Unirte al Grupo', style: TextStyle(color: _distritos.last.isFollowedByMe ? Colors.white : Colors.black))
                                              )
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 20.0,),
                                  SizedBox(height: 10.0,),],),
                          ),
                        ]),
                      ),


                      SizedBox(height: 10.0,),


                      SizedBox(height: 20,),




                    ],
                  ),
                )
              ]),
        ),
        )
    ));
  }
}

