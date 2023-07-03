// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_catalog/utils/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changebutton = false;
  final _formkey = GlobalKey<FormState>();
  movetohome(BuildContext) async {
    if (_formkey.currentState?.validate() ?? false) {
      setState(() {
        changebutton = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, Myroutes.homeroute);
      setState(() {
        changebutton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                Image.asset(
                  "assets/images/login_image.png",
                  fit: BoxFit.cover,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Welcome $name",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      TextFormField(
                        
                        decoration: const InputDecoration(
                            hintText: "Enter User Name",
                            labelText: "User Name"),
                        validator: (value) {
                         if (value == null || value.isEmpty){
                            return "please enter the user name";
                          }
                          return null;
                        },
                        onChanged: (value) {
                          name = value;
                          setState(() {});
                        },
                      ),
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                            hintText: "Enter Password",
                             labelText: "Password"),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Password cannot be empty";
                          } else if (value.length< 5) {
                            return "password should be of atleast 5 characters";
                          }
                          return null;
                        },
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Material(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(changebutton ? 50 : 8),
                  child: InkWell(
                    onTap: () => movetohome(context),
                    child: AnimatedContainer(
                      duration: Duration(seconds: 1),
                      width: changebutton ? 50 : 150,
                      height: 50,
                      alignment: Alignment.center,
                      child: changebutton
                          ? Icon(
                              Icons.done,
                              color: Colors.white,
                            )
                          : Text(
                              "Login",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                    ),
                  ),
                )
                // ElevatedButton(
                //   child: Text("Log In"),
                //   style: TextButton.styleFrom(minimumSize: Size(150, 40)),
                //   onPressed: () {
                //     Navigator.pushNamed(context, Myroutes.homeroute);
                //   },
                // )
              ],
            ),
          ),
        ));
  }
}
