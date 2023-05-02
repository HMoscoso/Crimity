import 'package:crimityapp/home/perfil.dart';
import 'package:crimityapp/map/ui/splash/splash_controller.dart';
import 'package:crimityapp/map/ui/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:getwidget/getwidget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../map/ui/pages/home/home_page.dart';
import '../map/ui/routes/pages.dart';
import '../map/ui/routes/routes.dart';
import '../prediccion_delito/predicciondelitos.dart';
import '../profile/profile_screen.dart';

class HomeCiudadanoScreen extends StatelessWidget{
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
        ),
        drawer: const NavigationDrawer(),

        backgroundColor: Color(0xFFF5F5F5),
        body: SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(children: <Widget>[
                    SizedBox(width: 50.0,),
                    Text(
                      'Hola, Andre ',
                      style: GoogleFonts.robotoMono(
                        fontSize: 30,
                      ),
                    ),
                    Image.asset("assets/imgs/handemoji.png", height: height * 0.05 )
                  ],),
                  

                  const SizedBox(height: 30),

                  Padding(padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child:MaterialButton(
                      elevation: 0.0,
                      minWidth: 300.0,
                      height: 150.0,
                      color: const Color(0xFFD8D7D6),
                      shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(20.0)),
                      child: Image.asset('assets/imgs/ubicacion.png', height: height*0.10,),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const HomePage()));},
                    ),
                  ),
                  const SizedBox(height: 50),

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
                        Text('Comunidad.', style: TextStyle(color: Theme.of(context).accentColor,
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
                        Text('Registrar delito.', style: TextStyle(color: Theme.of(context).accentColor,
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
      )
    );
  }
}

class NavigationDrawer extends StatelessWidget{
  const NavigationDrawer({super.key});

  @override
  Widget build(BuildContext context)=> Drawer(
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          buildHeader(context),
          buildMenuItems(context),
        ],
      )
    ),
  );

  Widget buildHeader(BuildContext context) => Container(
    color: Color(0xFFFFEC84),
    padding: EdgeInsets.only(
      top: 24 + MediaQuery.of(context).padding.top,
      bottom: 24,
    ),
    child: InkWell(
      onTap: (){
        Navigator.pop(context);

        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const ProfileScreen()));
    },
    child: Column(
      children: const[
        CircleAvatar(
          radius: 52,
          backgroundImage: NetworkImage('https://images.unsplash.com/photo-1533794299596-8e62c88ff975?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80'),
        ),
        SizedBox(height: 12),
        Text(
          'Andre Diaz',
          style:TextStyle(fontSize: 28, color: Colors.black87,),
        ),
        Text('andrediaz@gmail.com',
        style: TextStyle(fontSize: 16, color: Colors.black87,)),
      ],
    )
  ),
  );

  Widget buildMenuItems(BuildContext context) => Container(
    padding: const EdgeInsets.all(24),
    child: Wrap(
      runSpacing: 16,

    children: [
      ListTile(
        leading: const Icon(Icons.home_outlined),
        title: const Text('Home'),
        onTap: () {
          Navigator.pop(context);},
      ),
      ListTile(
        leading: const Icon(FontAwesomeIcons.mapLocationDot),
        title: const Text('Delitos en mi ubicacion'),
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const HomePage()));
        },
      ),
      ListTile(
        leading: const Icon(FontAwesomeIcons.feather),
        title: const Text('Registrar delito'),
        onTap: () {
  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const ProfileScreen()));},
      ),
      const Divider(color: Colors.black,),
      ListTile(
        leading: const Icon(FontAwesomeIcons.userTie),
        title: const Text('Mi Perfil'),
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const ProfileScreen()));},
      ),
      ListTile(
        leading: const Icon(FontAwesomeIcons.addressBook),
        title: const Text('Mi Comunidad'),
        onTap: () {},
      ),
      const Divider(color: Colors.black,),
      ListTile(
        leading: const Icon(FontAwesomeIcons.chartBar),
        title: const Text('Prediccion de Delitos'),
        onTap: () {},
      ),
    ],
    )
  );
  }