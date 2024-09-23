import 'package:flutter/material.dart';
import 'package:freelance_app/views/home.dart';
import 'package:freelance_app/views/login.dart';
import 'package:freelance_app/widgets/drop_down_list.dart';
import 'package:freelance_app/widgets/login_signup_helper.dart';
import 'package:freelance_app/widgets/text_field.dart';

class SignUp extends StatefulWidget {
  //final String role;

  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  var Fname = TextEditingController();
  var Sname = TextEditingController();
  var Email = TextEditingController();
  var Password = TextEditingController();
  var CountryChoosed = TextEditingController();

  var FormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    //for the form
    List<TextEditingController> controllers = [];
    controllers.add(Fname);
    controllers.add(Sname);
    controllers.add(Email);
    controllers.add(Password);
    controllers.add(CountryChoosed);
    //========================================================
    // for text field width and height
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double textformheight = screenHeight / 20;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
      ),

//=============================================================

      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Form(
            key: FormKey,
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
                  height: 15,
                ),
                //==================================================
                Column(
                  children: [
                    Row(
                      children: [
                        //=====================================
                        CustomTextField(
                          text: "First name",
                          Textfieldheight: textformheight,
                          Textfieldwidth: screenWidth / 2 - 40,
                          initialObsecureText: false,
                          ErrorText: "Enter Your First Name",
                          controller: Fname,
                        ),
                        //====================================
                        const SizedBox(
                          width: 20,
                        ),
                        //==============================
                        CustomTextField(
                          text: "Second name",
                          Textfieldheight: textformheight,
                          Textfieldwidth: screenWidth / 2 - 60,
                          initialObsecureText: false,
                          ErrorText: "Enter Your Second Name",
                          controller: Sname,
                        )
                      ],
                    ),
                    //=======================
                    CustomTextField(
                      text: "Email",
                      Textfieldheight: textformheight,
                      Textfieldwidth: screenWidth,
                      icon: Icons.email_outlined,
                      initialObsecureText: false,
                      ErrorText: "Enter Your Email",
                      controller: Email,
                    ),
                    //======================
                    CustomTextField(
                      text: "Password",
                      Textfieldheight: textformheight,
                      Textfieldwidth: screenWidth,
                      icon: Icons.no_encryption,
                      initialObsecureText: true,
                      icontextfield: Icons.remove_red_eye_rounded,
                      ErrorText: "Enter Your password",
                      controller: Password,
                    ),
//==============================================================
                    CountryDropdown(
                      TextError: "Please choose ur Country",
                      controller: CountryChoosed,
                    )
                  ],
                ),
                //=========================================
                const SizedBox(
                  height: 10,
                ),
                //==========================================
                const Divider(
                  color: Colors.black, // Color of the line
                  thickness: 1, // Thickness of the line
                ),
                //============================================
                // Next Button
                SignUpLoginHelper().getNextButton(choice :2 , page: Login(), context : context, FormKey: FormKey , controllers: controllers, option:  1),

                //==========================================================
                const SizedBox(
                  height: 15,
                ),
                //==========================================================
                SignUpLoginHelper().getCustomLink(
                    Login(), context, "Login", "Do you Have an Account ?  "),
                //==================================
              ],
            ),
          )),
    );
  }
}
