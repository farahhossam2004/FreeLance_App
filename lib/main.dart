import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:freelance_app/firebase_options.dart';
import 'package:freelance_app/views/home.dart';
import 'package:freelance_app/views/start.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MaterialApp(

    debugShowCheckedModeBanner: false,
    home: 
    Start(),

        // HomeScreen(), 
  ));
}