import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: Column(
          children: [
            Image.asset(
              "assets/images/login_image.png",
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Welcome",
              style: TextStyle(
                fontSize: 24,
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
                  labelText: "User Name"
            
                ),
              ),
                  TextFormField(
                    obscureText: true,
                // ignore: prefer_const_constructors
                decoration: InputDecoration(
                  hintText: "Enter Password",
                  labelText: "Password"
                ),
              )
             ],
              ),
            ),
              const SizedBox(
              height: 20,
            ),
            ElevatedButton(onPressed: (){
              print("hello user");
            }
            ,
             child: Text("Log In"),
             style:TextButton.styleFrom(),
             )
        
          ],
        ));
  }
}
