import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:freelance_app/models/job_model.dart';
import 'package:freelance_app/services/client_provider.dart';
import 'package:freelance_app/views/home.dart';
import 'package:freelance_app/widgets/drop_down_list.dart';
import 'package:freelance_app/widgets/multi_select_skills.dart';
import 'package:freelance_app/widgets/text_field.dart';
import 'package:freelance_app/services/array_data_for_test.dart';
import 'package:freelance_app/widgets/login_signup_helper.dart';
import 'package:provider/provider.dart';

class PostAJobScreen extends StatefulWidget {
  const PostAJobScreen({super.key});

  @override
  State<PostAJobScreen> createState() => _PostAJobScreenState();
}

class _PostAJobScreenState extends State<PostAJobScreen> {
  late ClientProvider clientProvider;
  String? selectedCategory;
  String? selectedSubcategory;
  List<String> subcategories = [];
  List<String?> selectedSkills = [];

  var titleController = TextEditingController();
  var descriptionController = TextEditingController();
  var budgetController = TextEditingController();
  var locationController = TextEditingController();
  var durationController = TextEditingController();
  var jobTypeController = TextEditingController();
  var subCategoryController = TextEditingController();
  var clientNameController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
      clientProvider =
            Provider.of<ClientProvider>(context, listen: false);
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
          child: SingleChildScrollView(
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
                            dataType: 'str',
                            Textfieldheight: textformheight),
                        CustomTextField(
                            text: 'Job Description',
                            Textfieldwidth: screenWidth - 40,
                            initialObsecureText: false,
                            ErrorText: 'You shoud enter the job description',
                            controller: descriptionController,
                            dataType: 'str',
                            Textfieldheight: textformheight),
                        Row(
                          children: [
                            CustomTextField(
                                text: '\$ Budget',
                                Textfieldwidth: screenWidth / 2 - 40,
                                initialObsecureText: false,
                                ErrorText: 'Enter a budget',
                                controller: budgetController,
                                dataType: 'num',
                                Textfieldheight: textformheight),
                            const SizedBox(
                              width: 10,
                            ),
                            CustomTextField(
                              text: 'Duration',
                              Textfieldwidth: screenWidth / 2 - 40,
                              initialObsecureText: false,
                              ErrorText: 'Enter the duration',
                              controller: durationController,
                              dataType: '',
                              Textfieldheight: textformheight,
                            ),
                          ],
                        ),
                        DropDownList(
                          TextError: "Enter job location ",
                          controller: locationController,
                          items: locationsList,
                          title: 'Location',
                        ),
                        DropDownList(
                          TextError: 'Enter the category of the job',
                          controller: jobTypeController,
                          items: jobCategories.keys.toList(),
                          title: 'Job Type',
                          onChanged: (newValue) {
                            setState(() {
                              selectedCategory = newValue;
                              if (selectedCategory != null) {
                                selectedSubcategory = null;
                                subcategories = selectedCategory != null
                                    ? jobCategories[selectedCategory]!
                                        .keys
                                        .toList()
                                    : [];
                                subCategoryController.clear();
                              } else {
                                subcategories = [];
                              }
                            });
                          },
                        ),
                        DropDownList(
                          TextError: 'Enter the sub category',
                          controller: subCategoryController,
                          items: subcategories,
                          title: 'Select Subcategory',
                          onChanged: (newValue) {
                            setState(() {
                              selectedSubcategory = newValue;
                            });
                          },
                        ),
                        // Multi Select Skills
                        if (selectedCategory != null &&
                            selectedSubcategory != null)
                          MultiSelectSkills(
                              category: selectedCategory!,
                              subCategory: selectedSubcategory!,
                              onSelectionChanged: (List<String?> skills) {
                                setState(() {
                                  selectedSkills = skills;
                                });
                              },
                              jobCategories: jobCategories),

                        ElevatedButton(
                          onPressed: _savePost,
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 12),
                            backgroundColor:
                                Colors.green, // Change color as needed
                          ),
                          child: const Text(
                            'Post',
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    )
                  ],
                )),
          ),
        ));
  }

  void _savePost() async {
    if (formKey.currentState?.validate() ?? false) {
      // Collect all data
      final jobData = JobModel(
          title: titleController.text,
          description: descriptionController.text,
          budget: budgetController.text,
          tags: selectedSkills,
          location: locationController.text,
          duration: durationController.text,
          jobType: jobTypeController.text,
          clientName: clientProvider.client!.personName,
          clientEmail: clientProvider.client!.Email,
          time: FieldValue.serverTimestamp());

      try {
        await FirebaseFirestore.instance.collection('Jobs-Posts').add({
          'title': titleController.text,
          'description': descriptionController.text,
          'budget': budgetController.text,
          'tags': selectedSkills,
          'location': locationController.text,
          'duration': durationController.text,
          'jobType': jobTypeController.text,
          'clientName': clientProvider.client!.personName,
          'clientEmail': clientProvider.client!.Email,
          'time': FieldValue.serverTimestamp()
        });
        // jobs.add(jobData);
        SignUpLoginHelper.showAwesomeDialog(
            context: context,
            title: 'Success',
            description: 'Job Posted Successfully',
            type: DialogType.success,
            page: HomeScreen());
      } catch (e) {
        SignUpLoginHelper.showAwesomeDialog(
            context: context,
            title: 'Error',
            description: 'Failed to post job: $e',
            type: DialogType.error);
      }

      // Navigator.pushReplacementNamed(context, '/home', arguments: jobData);
    }
  }
}
