import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyProfileScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    TextEditingController name = TextEditingController();
    TextEditingController email = TextEditingController();
    TextEditingController number = TextEditingController();
    TextEditingController password = TextEditingController();


    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white54,
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
        resizeToAvoidBottomInset: false,
        extendBodyBehindAppBar: true,
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/imgs/crime.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            padding: EdgeInsets.only(top:150.0),

            child: Stack(
            children: <Widget>[
              Column(children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top:60.0),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    )
                  ),
                  child: Column(children: <Widget>[
                    SizedBox(height: 50.0,),
                    Column( children: <Widget>[

                      const SizedBox(height: 30),
                      Text("Hillary Moscoso", style: Theme.of(context).textTheme.headlineMedium),
                      Text("hillary.moscoso3@gmail.com", style: Theme.of(context).textTheme.bodyMedium),
                      SizedBox(height: 40.0,),
                      Padding(padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context).cardColor,
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Form(
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            child: TextFormField(
                              initialValue: "Hillary Moscoso",
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.person_2_outlined),
                                border: InputBorder.none,
                                labelText: 'Nombre Completo',
                                hintText: 'Nombre Completo',
                              ),
                            ),
                          ),
                        ),),
                      SizedBox(height: 20.0,),
                      Padding(padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context).cardColor,
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Form(
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            child: TextFormField(
                              initialValue: "hillary.moscoso3@gmail.com",
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.email_outlined),
                                border: InputBorder.none,
                                labelText: 'Correo Electronico',
                                hintText: 'ejemplo@hotmail.com',
                              ),
                              validator: (value) {
                                String pattern =
                                    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                RegExp regExp = RegExp(pattern);
                                return regExp.hasMatch(value ?? '')
                                    ? null
                                    : '    Ingrese un correo valido';
                              },
                            ),
                          ),
                        ),),
                      SizedBox(height: 20.0,),
                      Padding(padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context).cardColor,
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Form(
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            child: TextFormField(
                              initialValue: "983457377",
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.phone_android_outlined),
                                border: InputBorder.none,
                                labelText: 'Numero Telefonico',
                                hintText: 'Numero Telefonico',
                              ),
                            ),
                          ),
                        ),),
                      SizedBox(height: 20.0,),
                      Padding(padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context).cardColor,
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Form(
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            child: TextFormField(
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.password_outlined),
                                border: InputBorder.none,
                                labelText: 'Contraseña',
                                hintText: 'Contraseña',
                              ),
                              validator: (value) {
                                return (value != null && value.length >= 6)
                                    ? null
                                    : '    La contraseña debe ser mayor o igual a 6 caracteres';
                              },
                            ),
                          ),
                        ),),
                      SizedBox(height: 20.0,),
                    ],)
                  ],),
                )
              ],),
              Align(
              alignment: Alignment.topCenter,
            child: Stack(
              children: <Widget>[
                ClipOval(
                  child: Image.network('https://images.unsplash.com/photo-1533794299596-8e62c88ff975?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
                    fit: BoxFit.cover,
                  width: 120,
                  height: 120,),
                ),
                Positioned(
                  bottom: 1,
                    right: 1,
                    child: Container(
                  padding: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    color: Colors.orangeAccent, shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.edit, size: 30.0),
                )),

              ],
            ),
    ),
            ]),
          ),
        )
    );

  }

  OutlineInputBorder myInputBorder(){
    return OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(20)),
      borderSide: BorderSide(
        color: Color(0xffd62828),
        width: 3,
      )
    );
  }


}