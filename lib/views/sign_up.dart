import 'package:flutter/material.dart';
import 'package:freelance_app/views/home.dart';
import 'package:freelance_app/widgets/text_field.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
      ),

//=============================================================

      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Center(
                    child: Text(
                  "Sign Up",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 0, 0, 0)),
                )),
              ),
              //==================================================
              const Divider(
                color: Colors.black, // Color of the line
                thickness: 1, // Thickness of the line
              ),
              //==================================================
              const SizedBox(
                height: 20,
              ),
              //==================================================
              Column(
                children: [
                  Row(
                    children: [
                      CustomTextField(
                        text: "First name",
                        Textfieldwidth: screenWidth / 2 - 40,
                        obsecuretext: false,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      CustomTextField(
                        text: "Second name",
                        Textfieldwidth: screenWidth / 2 - 60,
                        obsecuretext: false,
                      )
                    ],
                  ),
                  CustomTextField(
                    text: "Email",
                    Textfieldwidth: screenWidth,
                    icon: Icons.email_outlined,
                    obsecuretext: false,
                  ),
                  CustomTextField(
                    text: "Password",
                    Textfieldwidth: screenWidth,
                    icon: Icons.no_encryption,
                    obsecuretext: true,
                    icontextfield: Icons.remove_red_eye_rounded,
                  ),
                  CustomTextField(
                    text: "Country",
                    Textfieldwidth: screenWidth,
                    icon: Icons.home_rounded,
                    obsecuretext: false,
                  ),
                ],
              ),
              //=========================================
              const SizedBox(
                height: 20,
              ),
              //==========================================
              const Divider(
                color: Colors.black, // Color of the line
                thickness: 1, // Thickness of the line
              ),
              //============================================
              const SizedBox(
                height: 20,
              ),
              //============================================
              SizedBox(
              height: 50,
              width: 150,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      WidgetStateProperty.all<Color>(
                          const Color.fromARGB(255, 30, 193, 18)),
                ),
                onPressed: () { // bool value to disable the button when he didn't choose an option 
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                  );
                }  ,
                child: const Text(
                  "Next",
                  style:  TextStyle(
                    color: Colors.white,
                    fontSize:  20 ,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            ],
          )),
    );
  }
}
