import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:getwidget/getwidget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';



class BarGraphScreen extends StatelessWidget{
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
                  ),
                )
            )
        )
    );
  }
}