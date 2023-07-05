// ignore_for_file: prefer_const_constructors, prefer_const_declarations, prefer_const_literals_to_create_immutables, camel_case_types, unused_local_variable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class mydrawer extends StatelessWidget {
  const mydrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final imgurl =
        "https://digitalpress.fra1.cdn.digitaloceanspaces.com/zn3wniw/2021/11/pk.jpg";
    return Drawer(
      child: Container(
        color: Colors.deepPurple,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
                padding: EdgeInsets.zero,
                child: UserAccountsDrawerHeader(
                  margin: EdgeInsets.zero,
                  accountName: Text("Abhinandan Sharma",
                  style: TextStyle(color: Colors.white),),
                  accountEmail: Text("sabhi92003@gmail.com",
                  style: TextStyle(color: Colors.white)),
                  currentAccountPicture: CircleAvatar(
                      backgroundImage: AssetImage('assets/images/profile.jpg')),
                )
                ),
                ListTile(
                  leading: Icon(CupertinoIcons.home , color: Colors.white,),
                  title: Text("Home" , textScaleFactor: 1.2 , style: TextStyle(color: Colors.white),),
                ),
                ListTile(
                  leading: Icon(CupertinoIcons.profile_circled , color: Colors.white,),
                  title: Text("Profile" , textScaleFactor: 1.2 , style: TextStyle(color: Colors.white),),
                ),
                ListTile(
                  leading: Icon(CupertinoIcons.mail_solid , color: Colors.white,),
                  title: Text("Contact Me" , textScaleFactor: 1.2 , style: TextStyle(color: Colors.white),),
                )
          ],
        ),
      ),
    );
  }
}
