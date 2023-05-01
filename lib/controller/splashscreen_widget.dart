import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'model/model_splashscreen.dart';

class SplashScreenWidget extends StatelessWidget {
  const SplashScreenWidget({
    Key? key,
    required this.model,
  }) : super(key: key);

  final SplashScreenModel model;


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(40.0),
      color: model.bgcolor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image(
            image: AssetImage(model.image),
            height: size.height * 0.45,
          ),
          Column(
            children: [
              Text(
                model.title,
                style: GoogleFonts.raleway(
                  fontSize: 32,
                ),
              ),
              Text(
                model.subtitle,
                textAlign: TextAlign.center,
                style: GoogleFonts.raleway(
                  fontSize: 20,
                ),
              ),
            ],
          ),
          Text(
            model.counterText,
            style: Theme.of(context).textTheme.headline6,
          ),
          const SizedBox(
            height: 80.0,
          )
        ],
      ),
    );
  }
}