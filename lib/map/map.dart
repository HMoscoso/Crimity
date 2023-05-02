

import '../map/ui/routes/pages.dart';
import '../map/ui/routes/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});


// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Center(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: Routes.SPLASH,
          routes: appRoutes(),
        )
    );
  }
}