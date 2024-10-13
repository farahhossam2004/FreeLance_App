import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:freelance_app/firebase_options.dart';
import 'package:freelance_app/services/client_provider.dart';
import 'package:freelance_app/services/payments.dart';
import 'package:freelance_app/views/free_lancer.dart';
import 'package:freelance_app/views/home.dart';
import 'package:freelance_app/views/other_freeLancer_profile.dart';
import 'package:freelance_app/views/rate.dart';
import 'package:freelance_app/views/start.dart';
import 'package:freelance_app/views/test_profile.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  
  runApp(MultiProvider(

    
    providers: [
      ChangeNotifierProvider(create: (_) => ClientProvider())
    ],
    child:  const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:
      //TestProfile()
      // OtherFreelancerProfile(email: "memes2@gmail.com",),
      // HomeScreen(),
      Start(),
    ),
  ));
}