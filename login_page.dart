import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
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
            fontSize: 26,
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
              ElevatedButton(onPressed: (){},
                  child: Text("Login")),
            ],),
          )
        ],
      )
    );
  }
}
