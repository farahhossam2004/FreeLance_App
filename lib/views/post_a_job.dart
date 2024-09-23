import 'package:flutter/material.dart';
import 'package:freelance_app/widgets/text_field.dart';

class PostAJobScreen extends StatefulWidget {
  const PostAJobScreen({super.key});

  @override
  State<PostAJobScreen> createState() => _PostAJobScreenState();
}

class _PostAJobScreenState extends State<PostAJobScreen> {
  var titleController = TextEditingController();
  var descriptionController = TextEditingController();
  var budgetController = TextEditingController();
  var locationController = TextEditingController();
  var durationController = TextEditingController();
  var jobTypeController = TextEditingController();
  var clientNameController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    List<TextEditingController> controllers = [
      titleController,
      descriptionController,
      budgetController,
      locationController,
      durationController,
      jobTypeController,
      clientNameController,
    ];

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double textformheight = screenHeight / 20;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: const Text(
            'Write a Job Post',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 22, color: Colors.white),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          child: Form(
              key: formKey,
              child: Column(
                children: [
                  const SizedBox(
                    height: 8,
                  ),
                  Column(
                    children: [
                      CustomTextField(
                          text: 'Job Title',
                          Textfieldwidth: screenWidth - 40,
                          initialObsecureText: false,
                          ErrorText: 'You should enter a job title',
                          controller: titleController,
                          Textfieldheight: textformheight),
                      CustomTextField(
                          text: 'Job Description',
                          Textfieldwidth: screenWidth - 40,
                          initialObsecureText: false,
                          ErrorText: 'You shoud enter the job description',
                          controller: descriptionController,
                          Textfieldheight: textformheight),
                      Row(
                        children: [
                          CustomTextField(
                              text: '\$ Budget',
                              Textfieldwidth: screenWidth / 2 - 40,
                              initialObsecureText: false,
                              ErrorText: 'Enter a budget',
                              controller: budgetController,
                              Textfieldheight: textformheight),
                              const SizedBox(width: 10,),
                              CustomTextField(
                                text: 'Location',
                                Textfieldwidth: screenWidth / 2 - 40,
                                initialObsecureText: false,
                                ErrorText: 'Enter a location',
                                controller: locationController,
                                Textfieldheight: textformheight,
                              ),
                        ],
                      )
                    ],
                  )
                ],
              )),
        ));
  }
}
