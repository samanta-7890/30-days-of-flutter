import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changeButton = false;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset("assets/images/login_img.png",
              fit: BoxFit.cover,),
            SizedBox(
              height: 20.0,
            ),
            Text("Welcome $name",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 28,
              //color:  Colors.green,
            ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
              child: Column(children: [
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "Enter User Name",
                    labelText: "User Name",
                  ),
                  onChanged: (value){
                    name = value;
                    setState(() {

                    });
                  },
                ),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Enter PassWord",
                    labelText: "Password",
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                InkWell(
                  onTap: ()async {

                    setState(() {
                      changeButton = true;
                    });
                    await Future.delayed(Duration(seconds: 1));
                    Navigator.pushNamed(context, MyRoutes.homeRoute);
                  } ,
                  child: AnimatedContainer(
                    duration: Duration(seconds:1),
                    height: 50,
                    width: changeButton? 50 : 150,
                    //color: Colors.deepPurple,
                    alignment: Alignment.center,
                    child: changeButton?Icon(
                      Icons.done,
                      color: Colors.white,
                    ):Text("Login",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      shape: changeButton ? BoxShape.circle: BoxShape.rectangle,
                      //borderRadius: changeButton? BorderRadius.circular(40) : BorderRadius.circular(6),
                    ),
                  ),
                ),
                //ElevatedButton(onPressed: (){
                  //Navigator.pushNamed(context, MyRoutes.homeRoute);
                //},
                  //  child: Text("Login"),
                  //style: TextButton.styleFrom(minimumSize: Size(150, 40)),
                //),
              ],),
            )
          ],
        ),
      )
    );
  }
}
