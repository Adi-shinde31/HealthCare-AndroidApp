import 'package:firebase_auth/firebase_auth.dart';
import 'package:android_projects/auth.dart';
import 'package:android_projects/home.dart';
import 'package:android_projects/login.dart';
import 'package:flutter/material.dart ';

class WidgetTree extends StatefulWidget {
  const WidgetTree({Key? key}) : super(key: key);

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Auth().authStateChanges,
      builder: (context,snapshot){
        if(snapshot.hasData){
          return const Home();
        }
        else{
          return const LoginScreen();
        }
      },
    );
  }
}
