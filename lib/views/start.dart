import 'package:flutter/material.dart';
import 'package:freelance_app/views/login.dart';
import 'package:freelance_app/views/second_freelancer_signup.dart';
import 'package:freelance_app/views/sign_up.dart';
import 'package:freelance_app/widgets/login_signup_helper.dart';

import '../widgets/choosable_contai.dart';

class Start extends StatefulWidget {
  const Start({super.key});

  @override
  State<Start> createState() => _StartState();
}

class _StartState extends State<Start> {
  bool freelancerSelected = false;
  bool clientSelected = false;
  bool boxSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Center(
          child: Text(
            "Choose Your Role ",
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ),

      //================================================================
      body: Center(
        child: Column(
          children: [
            //==============================
            const SizedBox(height: 50),
            //=================================
            // Free lancer ChoosableContainer
            ChoosableContainer(
              isSelected: freelancerSelected,
              onToggle: () {
                setState(() {
                  freelancerSelected = !freelancerSelected;
                  if (clientSelected) {
                    // condition to make sure he cant choose both
                    clientSelected = !clientSelected;
                  }

                  if (freelancerSelected || clientSelected) {
                    boxSelected = true;
                  } else {
                    boxSelected = false;
                  }
                });
              },
              icon: const Icon(Icons.co_present_rounded,
                  size: 40, color: Colors.white),
              text: const Text(
                "I'm a Freelancer Looking For Work 🧑‍💻",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
//==========================================================================
            const SizedBox(
              height: 60,
            ),
//======================================================================
//client choosable  container
            ChoosableContainer(
              isSelected: clientSelected,
              onToggle: () {
                setState(() {
                  clientSelected = !clientSelected;
                  if (freelancerSelected) {
                    freelancerSelected =
                        !freelancerSelected; // condition to make sure  he cant choose both
                  }

                  if (freelancerSelected || clientSelected) {
                    boxSelected = true;
                  } else {
                    boxSelected = false;
                  }
                });
              },
              icon: const Icon(Icons.monetization_on_rounded,
                  size: 40, color: Colors.white),
              text: const Text(
                "I'm a client , hiring for a project",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
//=============================================================================
            const SizedBox(
              height: 150,
            ),
//===============================================================================
// The Button
            SizedBox(
              height: 50,
              width: 150,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: boxSelected
                      ? WidgetStateProperty.all<Color>(
                          const Color.fromARGB(255, 30, 193, 18))
                      : WidgetStateProperty.all<Color>(
                          const Color.fromARGB(255, 86, 88, 86)),
                ),
                onPressed: boxSelected?() { // bool value to disable the button when he didn't choose an option 
                  freelancerSelected?
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SignUp(role: "FreeLancer")),
                  ) :
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SignUp(role: "Client")),
                  )
                  ;
                } : null ,
                child: Text(
                  boxSelected ? (freelancerSelected? "join as freelancer" : "join as client") : "Choose a role",
                  style:  TextStyle(
                    color: Colors.white,
                    fontSize: freelancerSelected? 12 : 15 ,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
//========================================================================
            const SizedBox(
              height: 20,
            ),
//==========================================================================
            SignUpLoginHelper().getCustomLink( Login(), context, "Login" , "Already Have An Account  ")
//===============================================================================
          ],
        ),
      ),
    );
  }
}
