import 'dart:io';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:freelance_app/services/array_data_for_test.dart';
import 'package:freelance_app/views/client_profile.dart';
import 'package:freelance_app/views/home.dart';
import 'package:freelance_app/views/login.dart';
import 'package:freelance_app/views/second_freelancer_signup.dart';
import 'package:freelance_app/views/start.dart';
import 'package:freelance_app/widgets/drop_down_list.dart';
import 'package:freelance_app/widgets/login_signup_helper.dart';
import 'package:freelance_app/widgets/text_field.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
// import 'package:rflutter_alert/rflutter_alert.dart'; // Assuming you're using rflutter_alert for dialog boxes

class SignUp extends StatefulWidget {
  final String role;

  const SignUp({super.key, required this.role});

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
  bool isLoading = false;

  Widget page = const Start();
  late int option;

  File? _image;
  final picker = ImagePicker();
  final FirebaseStorage _storage = FirebaseStorage.instance;

  @override
  void initState() {
    super.initState();
    if (widget.role == 'FreeLancer') {
      option = 1;
    } else {
      option = 3;
    }
  }

  // Pick image from gallery
  Future<void> _pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }

  // Upload image to Firebase Storage and return the URL
  Future<String?> _uploadImage(String userEmail) async {
    if (_image == null) return null;

    try {
      Reference ref =
          _storage.ref().child('users-profileImages/$userEmail.jpg');
      UploadTask uploadTask = ref.putFile(_image!);
      TaskSnapshot snapshot = await uploadTask;
      String downloadUrl = await snapshot.ref.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      print('Error uploading image: $e');
      return null;
    }
  }

  CollectionReference clients = FirebaseFirestore.instance.collection('Users');
  // Add client data to Firestore with the image URL
  Future<void> addClient(String? imageUrl) async {
    try {
      await clients.doc(Email.text).set({
        'full_name': "${Fname.text} ${Sname.text}",
        'email': Email.text,
        'Country': CountryChoosed.text,
        'role': 'client',
        'rate': [],
        'image_url': imageUrl ?? '', // Store image URL
      });
    } catch (error) {
      SignUpLoginHelper.showAwesomeDialog(
          context: context,
          title: 'Error occured',
          description: 'Oops something went wrong :( , Try again later',
          type: DialogType.error);
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double textformheight = screenHeight / 20;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
      ),
      body: ModalProgressHUD(
        inAsyncCall: isLoading,
        child: SingleChildScrollView(
          child: Padding(
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
                        ),
                      ),
                    ),
                    const Divider(
                      color: Colors.black,
                      thickness: 1,
                    ),
                    const SizedBox(height: 15),
                    Column(
                      children: [
                        Row(
                          children: [
                            CustomTextField(
                              text: "First name",
                              Textfieldheight: textformheight,
                              Textfieldwidth: screenWidth / 2 - 40,
                              initialObsecureText: false,
                              ErrorText: "Enter Your First Name",
                              controller: Fname,
                              dataType: 'str',
                            ),
                            const SizedBox(width: 20),
                            CustomTextField(
                              text: "Second name",
                              Textfieldheight: textformheight,
                              Textfieldwidth: screenWidth / 2 - 60,
                              initialObsecureText: false,
                              ErrorText: "Enter Your Second Name",
                              controller: Sname,
                              dataType: 'str',
                            ),
                          ],
                        ),
                        CustomTextField(
                          onChange: (data) => Email.text = data,
                          text: "Email",
                          Textfieldheight: textformheight,
                          Textfieldwidth: screenWidth,
                          icon: Icons.email_outlined,
                          initialObsecureText: false,
                          ErrorText: "Enter Your Email",
                          controller: Email,
                          dataType: 'email',
                        ),
                        CustomTextField(
                          onChange: (data) => Password.text = data,
                          text: "Password",
                          Textfieldheight: textformheight,
                          Textfieldwidth: screenWidth,
                          icon: Icons.no_encryption,
                          initialObsecureText: true,
                          icontextfield: Icons.remove_red_eye_rounded,
                          ErrorText: "Enter Your password",
                          controller: Password,
                          dataType: 'num',
                        ),
                        DropDownList(
                          items: countriesList,
                          title: 'Country',
                          TextError: "Please choose your Country",
                          controller: CountryChoosed,
                        ),
                      ],
                    ),
                    //=============================================================
                    const SizedBox(height: 4),

                    //============================================================
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton.icon(
                        onPressed: _pickImage,
                        icon: const CircleAvatar(
                          radius: 12, // Adjust radius as needed
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.camera_alt,
                            color: Colors.green,
                            size: 16,
                          ),
                        ),
                        label: const Text('Select Profile Picture' , style: TextStyle(color: Colors.white , fontSize: 18 , fontWeight: FontWeight.bold),),
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 44, 170, 49), // Button background color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                8), 
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 20), // Adjust padding
                        ),
                      ),
                    ),

                    //===============================================
                    const Divider(
                      color: Colors.black,
                      thickness: 1,
                    ),
                    //=====================================================
                    const SizedBox(height: 5,),
                    SignUpLoginHelper().getNextButton(
                      page: page,
                      context: context,
                      FormKey: FormKey,
                      onTap: () async {
                        if (FormKey.currentState!.validate()) {
                          if (option == 1) {
                            String? imageUrl = await _uploadImage(Email.text);
                            page = SecondFreelancerSignup(
                              imageURL: imageUrl,
                              Email: Email.text,
                              country: CountryChoosed.text,
                              password: Password.text,
                              first_name: Fname.text,
                              second_name: Sname.text,
                            );
                            SignUpLoginHelper.showAwesomeDialog(
                                context: context,
                                title: 'One More Step :)',
                                description: 'Continue...',
                                type: DialogType.success,
                                page: page);
                          } else {
                            try {
                              setState(() => isLoading = true);
                              await SignUpLoginHelper.UserRegister(
                                  Email.text, Password.text);
                              String? imageUrl = await _uploadImage(Email.text);
                              // print(imageUrl);
                              await addClient(imageUrl);
                              
                              SignUpLoginHelper.showAwesomeDialog(
                                  context: context,
                                  title: 'Successfully registered',
                                  description: 'Welcome, Good Luck!',
                                  type: DialogType.success,
                                  page: Login()
                                  );
                            } on FirebaseAuthException catch (e) {
                              if (e.code == 'weak-password') {
                                SignUpLoginHelper.showAwesomeDialog(
                                    context: context,
                                    title: 'Weak Password',
                                    description:
                                        'Enter a strong password and try again',
                                    type: DialogType.error);
                              } else if (e.code == 'email-already-in-use') {
                                SignUpLoginHelper.showAwesomeDialog(
                                    context: context,
                                    title: 'Email already used before',
                                    description:
                                        'Log in or try an another email',
                                    type: DialogType.error);
                              } else {
                                SignUpLoginHelper.showAwesomeDialog(
                                    context: context,
                                    title: 'Error occured',
                                    description: 'Try again',
                                    type: DialogType.error);
                              }
                            }
                          }
                          isLoading = false;
                          setState(() {});
                        }
                      },
                    ),

                    //==========================================================
                    const SizedBox(
                      height: 15,
                    ),
                    //==========================================================
                    SignUpLoginHelper().getCustomLink(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Login()));
                        },
                        nextPageString: "Login",
                        firstWord: "Do you Have an Account ?  "),
                    //==================================
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
