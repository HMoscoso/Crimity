import 'dart:ffi';

import 'package:crimityapp/home/home_ciudadano.dart';
import 'package:crimityapp/prediccion_delito/prediccion_bargraph.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:getwidget/getwidget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:location/location.dart' as a;
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'dart:io';

import '../google_map/traking_page.dart';




class CrimeRegisterScreen extends StatefulWidget{


  @override
  State<CrimeRegisterScreen> createState() => _CrimeRegisterScreenState();

  CrimeRegisterScreen(){
    _selectedVal = _crimeList[0];
  }
  final _crimeList = ["Robo de pertenencias", "Robo de vehiculo", "Amenaza e intimidacion", "Maltrato y ofensa sexual", "Robo de negocio", "Secuestro y extorsion", "Asesinato", "Otro"];
  String? _selectedVal = "";

}

class _CrimeRegisterScreenState extends State<CrimeRegisterScreen> {

  registrarDelito(double latitude, double longitude, String ndelito, String descripcion) async {

    var url = Uri.parse('http://192.168.100.4:4000/crimes/post');
    var response = await http.post(url,
        body: {
          "latitude": latitude.toString(),
          "longitude": longitude.toString(),
          "ndelito": ndelito,
          "descripcion": descripcion,
        });
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    Widget okButton = TextButton(
      child: Text("Si"),
      style: TextButton.styleFrom(primary: Colors.deepOrange),
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=> TrackingScreen()));},
    );
    Widget noButton = TextButton(
      child: Text("No"),
      style: TextButton.styleFrom(primary: Colors.deepOrange),
      onPressed: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=> HomeCiudadanoScreen()));},
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Gracias!"),
      content: Text("El delito se ha registrado satisfactoriamente. ¿Desea visualizar el delito registrado?"),
      actions: [
        okButton,
        noButton,
      ],
    );

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        });


  }

  final TextEditingController delitoController = TextEditingController();
  final TextEditingController descripcionController = TextEditingController();

  final _formKey = GlobalKey<FormState>();


  a.LocationData? currentLocation;
  String currentAddress = '';
  TextEditingController _address = new TextEditingController();

  Future<void> getCurrentLocation () async {
    a.Location location = a.Location();

    location.getLocation().then((location){
      currentLocation = location;
    });

    currentLocation = await Future.any([
      location.getLocation(),
      Future.delayed(Duration(seconds: 5), () => null),
    ]);
    if (currentLocation == null) {
      currentLocation = await location.getLocation();
    }
    else {}

    location.onLocationChanged.listen((newLoc) {
      currentLocation = newLoc;

      setState(() {

      });
    });

    _getAddress(currentLocation);
  }

  Future<void> _getAddress(currentLocation) async {
    List<Placemark> p = await placemarkFromCoordinates(currentLocation.latitude, currentLocation.longitude);
    Placemark place = p[0];

    currentAddress = p.reversed.last.country.toString() + ' ' + p.reversed.last.locality.toString();

    _address.text =p.reversed.last.street.toString()+ ', ' + p.reversed.last.locality.toString();
  }


  @override
  initState(){
    getCurrentLocation();
    super.initState();

  }


  @override
  Widget build(BuildContext context){
    var height = MediaQuery.of(context).size.height;
    final policeNum = '105';
    final firefighterNum = '116';


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
            body:currentLocation == null
                ? const Center(child: Text("Loading"))
                : SingleChildScrollView(
                child: Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Registrar Delito',
                            style: GoogleFonts.bebasNeue(
                              fontSize: 35,
                            ),
                          ),
                          SizedBox(height: 20,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Ingrese los detalles del delito',
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
                                'para guardarlo en la aplicacion.',
                                style: TextStyle(
                                  color:  Theme.of(context).accentColor,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 40,),
                          Row(
                            children: [
                              const SizedBox(width: 40.0,),
                              Text(
                                'Ubicacion.',
                                style: TextStyle(
                                  color:  Theme.of(context).accentColor,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 5,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(width: 35.0,),
                              new Flexible(
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).cardColor,
                                    border: Border.all(color: Colors.white),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 20.0),

                                    child: TextFormField(
                                      controller: _address,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: 'Ubicacion',
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 35.0,),

                            ],
                          ),
                          SizedBox(height: 30,),
                          Row(
                            children: [
                              const SizedBox(width: 40.0,),
                              Text(
                                'Tipo de Delito.',
                                style: TextStyle(
                                  color:  Theme.of(context).accentColor,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 5,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(width: 37.0,),
                              new Flexible(
                                child: DropdownButtonFormField(
                                  value: widget._selectedVal,
                                  items: widget._crimeList.map((e) => DropdownMenuItem(child: Text(e), value: e,)).toList(),
                                  onChanged: (val){
                                    setState((){
                                      widget._selectedVal = val as String;
                                    });
                                  },)
                              ),
                              const SizedBox(width: 35.0,),

                            ],
                          ),
                          SizedBox(height: 30,),
                          Row(
                            children: [
                              const SizedBox(width: 40.0,),
                              Text(
                                'Descripcion del delito.',
                                style: TextStyle(
                                  color:  Theme.of(context).accentColor,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 5,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(width: 35.0,),
                              new Flexible(
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).cardColor,
                                    border: Border.all(color: Colors.white),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 20.0),

                                    child: TextFormField(
                                      controller: delitoController,
                                      maxLines: null,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: 'Ingresa la descripcion del delito.',
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 35.0,),

                            ],
                          ),
                          SizedBox(height: 30,),

                          Padding(padding: const EdgeInsets.symmetric(horizontal: 35.0),
                            child:MaterialButton(
                              elevation: 0.0,
                              minWidth: 400.0,
                              height: 50.0,
                              color: Theme.of(context).primaryColor,
                              shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(10.0)),
                              child: const Text(
                                'Registrar',
                                style: TextStyle(
                                    color: Color(0xFF212121),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0
                                ),
                              ),
                              onPressed: () {
                                registrarDelito(currentLocation!.latitude!, currentLocation!.longitude!, widget._selectedVal!, delitoController.text);
                              },
                            ),
                          ),
                    SizedBox(height: 30,),
                          Row(children: <Widget>[
                            Expanded(
                              child: Container(
                                  margin: const EdgeInsets.only(left: 25.0, right: 20.0),
                                  child: const Divider(
                                    color: Colors.black,
                                    height: 36,
                                  )),
                            ),
                            const Text("Llamar a"),
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
                        children: [
                          const SizedBox(width: 35.0,),
                          Expanded(child:
                          OutlinedButton(onPressed: () async {
                            launch('tel://$policeNum');
                          },
                              style: OutlinedButton.styleFrom(
                                  shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(10.0)),
                                  foregroundColor: Theme.of(context).accentColor,
                                  side: BorderSide(color: Theme.of(context).accentColor),
                                  padding: EdgeInsets.symmetric(vertical: 15.0)
                              ),
                              child: Text("Policia".toUpperCase()))),
                          const SizedBox(width: 10.0,),
                          Expanded(
                            child: ElevatedButton(
                                onPressed: () async {
                                  launch('tel://$firefighterNum');
                                },
                                style: OutlinedButton.styleFrom(
                                    shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(10.0)),
                                    padding: EdgeInsets.symmetric(vertical: 15.0)
                                ),
                                child: Text("Bomberos".toUpperCase())),
                          ),
                          const SizedBox(width: 35.0,),
                        ],
                    ),
                          const SizedBox(height: 20),




                        ]
                    )

                )
            )
        )
    );
  }
}