import 'package:flutter/material.dart';


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
                  Navigator.pushReplacementNamed(context, 'loginst');},
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
                      onPressed: (){
                    Navigator.pushReplacementNamed(context, 'register');
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(10.0)),
                        padding: EdgeInsets.symmetric(vertical: 15.0)
                      ),
                      child: Text("Registrarse")),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}