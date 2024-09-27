// ignore_for_file: non_constant_identifier_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:freelance_app/models/free_lancer.dart';
import 'package:freelance_app/models/person_helpers.dart';
import 'package:freelance_app/views/free_lancer.dart';
import 'package:freelance_app/widgets/custom_multiple_dropdownlist.dart';
import 'package:freelance_app/widgets/customslider.dart';
import 'package:freelance_app/widgets/login_signup_helper.dart';
import 'package:freelance_app/widgets/profile_helpers.dart';
import 'package:freelance_app/widgets/text_field.dart';

class SecondFreelancerSignup extends StatefulWidget {
  String first_name;
  String second_name;
  String Email;
  String password;
  String country;

  SecondFreelancerSignup(
      {super.key,
      required this.Email,
      required this.first_name,
      required this.country,
      required this.password,
      required this.second_name});

  @override
  State<SecondFreelancerSignup> createState() => _SecondFreelancerSignupState();
}

class _SecondFreelancerSignupState extends State<SecondFreelancerSignup> {
  // For Form //================================================
  double currentSliderValue = 0;
  var price = TextEditingController();
  var aboutme = TextEditingController();
  var FormKey = GlobalKey<FormState>();
  //==============================================================
  List<String> selected_skills = [];
  List<String> selected_languages = [];

  List<String> skills = [
    "UI/UX",
    "Java",
    'Kotlin',
    'Java Script',
    'python',
    'dart',
    'angular',
    'mongo',
    'C++',
    'C',
    'Mobile app',
    'Flutter',
    'Android',
    'odoo',
  ];

  List<String> languages = ["Arabic", "Englisch", "Germany", "Frensch"];

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;
    //========================================================
    List<TextEditingController> controllers = [];
    controllers.add(price);
    controllers.add(aboutme);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
      ),
      body: Form(
        key: FormKey,
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  children: [
                    const Text(
                      "One more step !",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    //================================================
                    SizedBox(height: screenHeight / 20),
                    const Divider(
                      thickness: 1,
                      color: Colors.grey,
                    ),
                    SizedBox(height: screenHeight / 25),
                    //=======================================================
                    Row(
                      children: [
                        Column(
                          children: [
                            Customslider(
                              text: "Enter your price \$/h",
                              currentSliderValue: currentSliderValue,
                              screenwidth: screenwidth,
                              max: 1500,
                              min: 0,
                              onChanged: (double value) {
                                setState(() {
                                  currentSliderValue = value;
                                });
                              },
                            ),
                            //===============================================
                          ],
                        ),
                        const Spacer(),
                        ProfileHelpers().getProfileContainer(
                          title: "Price",
                          item: "$currentSliderValue \$",
                        ),
                      ],
                    ),
                    //========================================================
                    SizedBox(height: screenHeight / 20),
                    const Divider(
                      thickness: 1,
                      color: Colors.grey,
                    ),
                    SizedBox(height: screenHeight / 25),

                    //========================================================
                    SizedBox(
                      width: screenwidth,
                      height: 150,
                      child: MultipleChoiceDropdown(
                        buttontext: "Skills",
                        text: "Select Skills Below",
                        options: skills,
                        selectedOptions: selected_skills,
                        onOptionsChanged: (List<String> newoptions) {
                          setState(() {
                            selected_skills = newoptions;
                          });
                        },
                      ),
                    ),
                    //===================================================
                    const SizedBox(height: 0),
                    const Divider(
                      thickness: 1,
                      color: Colors.grey,
                    ),
                    const SizedBox(height: 20),
                    //=================================================
                    SizedBox(
                      width: screenwidth,
                      height: 150,
                      child: MultipleChoiceDropdown(
                        buttontext: "Language",
                        text: "Select Languages Below",
                        options: languages,
                        selectedOptions: selected_languages,
                        onOptionsChanged: (List<String> newlist) {
                          setState(() {
                            selected_languages = newlist;
                          });
                        },
                      ),
                    ),
                    //==================================================
                    const SizedBox(height: 0),
                    const Divider(
                      thickness: 1,
                      color: Colors.grey,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    //=================================================
                    const Center(
                        child: Text(
                      "About You",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    )),

                    CustomTextField(
                        text: " ",
                        Textfieldwidth: screenwidth,
                        initialObsecureText: false,
                        ErrorText: "Talk about yourself",
                        controller: aboutme,
                        dataType: 'str',
                        Textfieldheight: 100),
                    //===========================================
                    const Divider(
                      thickness: 1,
                      color: Colors.grey,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    //========================================
                    SizedBox(
                      height: 50,
                      width: 150,
                      child: ElevatedButton(
                        onPressed: () {
                          if (selected_languages.isEmpty ||
                              selected_skills.isEmpty ||
                              currentSliderValue == 0 ||
                              aboutme.text.isEmpty) {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return SignUpLoginHelper().getCustomAlert(
                                    "Incomplete Form",
                                    "Please fill all field and determine a price before proceeding",
                                    context);
                              },
                            );
                          } else {
                            

                            FreeLancer freeLancer_new = FreeLancer(
                                personName: PersonHelpers.GetCurrentfreeLancer().getPersonName,
                                role: "FreeLancer",
                                country: PersonHelpers.GetCurrentfreeLancer().getPersonCountry,
                                skills: selected_skills,
                                price: currentSliderValue,
                                aboutMe: aboutme.text,
                                languages: selected_languages,
                                Email: PersonHelpers.GetCurrentfreeLancer().getPersonEmail,
                                password: PersonHelpers.GetCurrentfreeLancer().getPersonPassword
                                );

                            PersonHelpers.SetCurrentFreeLancer(freeLancer_new);

                            if (FormKey.currentState!.validate()) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                      FreeLancerProfile()
                                        ), // Change FreelancerHome to your next screen widget
                              );
                            }
                          }
                        },
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all<Color>(
                            const Color.fromARGB(255, 30, 193, 18),
                          ),
                        ),
                        child: const Text(
                          "Next",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
