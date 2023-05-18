import 'dart:async';

import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'dart:io';

import '../home/home_ciudadano.dart';

class TrackingScreen extends StatefulWidget {
  const TrackingScreen({Key? key}) : super(key: key);

  @override
  State<TrackingScreen> createState() => OrderTrackingPageState();
}

class MapMarker extends StatelessWidget {
  final String name;
  MapMarker(this.name);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90.0,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 40.0,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.white,
                ),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(14),
                    topRight: Radius.circular(14))),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 8.0),
                child: Text(
                  name,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: Colors.green,
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Container(
              height: 10.0,
              decoration: BoxDecoration(
                  color: Colors.green,
                  border: Border.all(
                    color: Colors.green,
                  ),
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(14),
                      bottomLeft: Radius.circular(14)))),
          ClipPath(
            clipper: CustomClipPath(),
            child: Container(
              height: 36.0,
              color: Colors.green,
            ),
          )
        ],
      ),
    );
  }
}

class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(size.width / 3, 0.0);
    path.lineTo(size.width / 2, size.height / 3);
    path.lineTo(size.width - size.width / 3, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class OrderTrackingPageState extends State<TrackingScreen> {
  final Completer<GoogleMapController> _controller = Completer();

  static const LatLng sourceLocation = LatLng(-11.9944520, -77.0791182);
  static const LatLng destination = LatLng(-11.994713, -77.078202);

  CustomInfoWindowController _customInfoWindowController = CustomInfoWindowController();

  LocationData? currentLocation;

  BitmapDescriptor sourceIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor crimityIcon = BitmapDescriptor.defaultMarker;

  Future<void> getCurrentLocation() async {
    Location location = Location();

    location.getLocation().then((location) {
      currentLocation = location;
    });

    currentLocation = await Future.any([
      location.getLocation(),
      Future.delayed(Duration(seconds: 5), () => null),
    ]);
    if (currentLocation == null) {
      currentLocation = await location.getLocation();
    }

    location.onLocationChanged.listen((newLoc) {
      currentLocation = newLoc;

      setState(() {

      });
    });

    Marker markercurrent = Marker(
      markerId: MarkerId("current"),
      position: LatLng(currentLocation!.latitude!, currentLocation!.longitude!),
    );
    _marker.add(markercurrent);


  }

  late Map data;
  late List crimesData;

  getCrimes() async {
    var url = Uri.parse('http://192.168.100.4:4000/crimes');
    http.Response response = await http.get(url);
    debugPrint(response.body);
    data = json.decode(response.body);

    setState(() {
      crimesData = data['crimes'];
    });


    setMarkers();
  }



  List<Marker> _marker = [];


  setMarkers() {


    var i = 0;
    crimesData.forEach((element) {
      Marker markercrime = Marker(
          markerId: MarkerId("${crimesData[i]['crimeId']}"),
          icon: crimityIcon,
          position: LatLng(crimesData[i]["latitude"], crimesData[i]["longitude"]),
        infoWindow:  InfoWindow(
          title: crimesData[i]["ndelito"],
          snippet: crimesData[i]["descripcion"],
        )
      );
      i++;
      _marker.add(markercrime);
    });
  }



  void setCustomMarkerIcon(){
    BitmapDescriptor.fromAssetImage(ImageConfiguration.empty, "assets/imgs/ladron.png").then(
        (icon){
          crimityIcon = icon;
        }
    );
  }

  @override
  void initState() {
    getCurrentLocation();
    setCustomMarkerIcon();
    getCrimes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white54,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=> HomeCiudadanoScreen()));},
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black54,
          ),
        ),
        centerTitle: true,
      ),
      body: currentLocation == null
          ? const Center(child: Text("Loading"))
      : GoogleMap(
        initialCameraPosition:
        CameraPosition(target: LatLng(currentLocation!.latitude!, currentLocation!.longitude!), zoom: 20),
        markers: _marker.map((e) => e).toSet(),
      ),
    );
  }
}
