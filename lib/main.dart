import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:freelance_app/firebase_options.dart';
import 'package:freelance_app/services/user_provider.dart';
import 'package:freelance_app/views/start.dart';
import 'package:freelance_app/views/test_profile.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (_) => UserProvider())],
    child: const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:
          //TestProfile()
          // OtherFreelancerProfile(email: "memes2@gmail.com",),
          // HomeScreen(),
          Start(),
          // ClientWall()
    ),
  ));
}
