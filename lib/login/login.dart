import 'package:crimityapp/login/signin.dart';
import 'package:flutter/material.dart';

import 'Login_start.dart';

class LoginScreen extends StatelessWidget{
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image(image: AssetImage("assets/imgs/wewea.PNG"), height: height * 0.35,),
            Column(
              children: [
                Text("¡Bienvenido!", style: Theme.of(context).textTheme.headline1,),
              ],
            ),
            Row(
              children: [
                Expanded(child:
                OutlinedButton(onPressed: (){
    Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Login_start()));},
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(10.0)),
                      foregroundColor: Theme.of(context).accentColor,
                      side: BorderSide(color: Theme.of(context).accentColor),
                      padding: EdgeInsets.symmetric(vertical: 15.0)
                    ),
                    child: Text("Iniciar Sesion".toUpperCase()))),
                const SizedBox(width: 10.0,),
                Expanded(
                  child: ElevatedButton(
                      onPressed: (){    Navigator.of(context).push(MaterialPageRoute(builder: (context)=> SigninScreen()));},

                      style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(10.0)),
                      padding: EdgeInsets.symmetric(vertical: 15.0)
                      ),
                      child: Text("Registrarse")),
                ),

                const SizedBox(height: 20.0,),
              ],
            )
          ],
        ),
      ),
    );
  }
}