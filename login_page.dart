import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/routes.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

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
            Text("Welcome",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 28,
              //color:  Colors.green,
            ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 16.0),
              child: Column(children: [
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "Enter User Name",
                    labelText: "User Name",
                  ),
                ),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Enter PassWord",
                    labelText: "Password",
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                ElevatedButton(onPressed: (){
                  Navigator.pushNamed(context, MyRoutes.homeRoute);
                },
                    child: Text("Login"),
                  style: TextButton.styleFrom(minimumSize: Size(150, 40)),
                ),
              ],),
            )
          ],
        ),
      )
    );
  }
}
