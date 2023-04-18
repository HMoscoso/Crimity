import 'package:flutter/material.dart';


class SplashScreen3 extends StatelessWidget{
  const SplashScreen3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Image.asset('assets/imgs/splash3.PNG'),
            Column(
              children: <Widget>[
                Text(
                  'Registra los',
                  style: Theme.of(context).textTheme.headline1,
                ),
                Text(
                  'delitos cercanos',
                  style: Theme.of(context).textTheme.headline1,
                ),
                Text(
                  'a ti',
                  style: Theme.of(context).textTheme.headline1,
                ),
              ],
            ),
            Column(
              children: <Widget>[
                Image.asset('assets/imgs/part3.PNG',
                    width: 50,
                    height: 70),
                Material(
                  shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(22.0) ),
                  clipBehavior: Clip.antiAlias,
                  child: MaterialButton(
                    elevation: 0.0,
                    minWidth: 300.0,
                    height: 50.0,
                    color: Theme.of(context).primaryColor,
                    child: const Text(
                      'Siguiente',
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


          ],
        ),
      ),
    );
  }
}