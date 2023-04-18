import 'package:flutter/material.dart';


class SplashScreen2 extends StatelessWidget{
  const SplashScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Image.asset('assets/imgs/splash2.PNG'),
            Column(
              children: <Widget>[
                Text(
                  'Graficos',
                  style: Theme.of(context).textTheme.headline2,
                ),
                Text(
                  'estadisticos certeros',
                  style: Theme.of(context).textTheme.headline2,
                ),
                Text(
                  'a base de datos',
                  style: Theme.of(context).textTheme.headline2,
                ),
                Text(
                  'reales',
                  style: Theme.of(context).textTheme.headline2,
                ),
              ],
            ),
            Column(
              children: <Widget>[
                Image.asset('assets/imgs/part2.PNG',
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