import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'loading.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    // home: Home(),
    routes: {
      "/" : (context) => const loading(),
      // "/" : (context) => Home(),
    },
  ));
}