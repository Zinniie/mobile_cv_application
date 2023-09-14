import 'package:flutter/material.dart';
import 'package:mobile_cv_application/Widgets/default_button.dart';
import 'package:mobile_cv_application/utils/sizeconfig.dart';

import '../Widgets/lists_classes.dart';
import '../Widgets/reusable_textformfield.dart';
import '../ui/appstyle.dart';
import '../ui/constants.dart';

class EditProfileScreen extends StatefulWidget {
  final String currentName;
  final String currentSlackName;
  final String currentGitHubURL;
  final List<String> currentInterests;
  final List<Skill> currentSkills;
  final String currentBio;

  final List<String> currentTrainingsCertifications;
  final List<Education> currentEducation;

  final List<String> currentTechnicalProficiencies;
  final List<Experience> currentExperience;

  const EditProfileScreen({
    super.key,
    required this.currentInterests,
    required this.currentSkills,
    required this.currentBio,
    required this.currentName,
    required this.currentSlackName,
    required this.currentGitHubURL,
    required this.currentTrainingsCertifications,
    required this.currentEducation,
    required this.currentTechnicalProficiencies,
    required this.currentExperience,
  });

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController bioController = TextEditingController();
  final TextEditingController interestsController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController slackNameController = TextEditingController();
  final TextEditingController gitHubHandleController = TextEditingController();
  List<Skill> editedSkills = [];
  List<TextEditingController> skillNameControllers = [];
  List<TextEditingController> skillPercentageControllers = [];
  List<Color> skillColorControllers = [];

  final TextEditingController trainingsCertificationsController =
      TextEditingController();
  final List<TextEditingController> educationNameControllers = [];
  final List<TextEditingController> educationYearControllers = [];
  final List<TextEditingController> educationCertificateControllers = [];
  List<Education> editedEducationList = [];

  final TextEditingController technicalProficienciesController =
      TextEditingController();
  final List<TextEditingController> experienceCompanyControllers = [];
  final List<TextEditingController> experienceYearControllers = [];
  final List<TextEditingController> experienceRoleControllers = [];
  final List<TextEditingController> experienceResponsibilityControllers = [];

  @override
  void initState() {
    super.initState();
    bioController.text = widget.currentBio;
    interestsController.text = widget.currentInterests.join(', ');
    slackNameController.text = widget.currentSlackName;
    gitHubHandleController.text = widget.currentGitHubURL;
    nameController.text = widget.currentName;

    editedSkills = List.from(widget.currentSkills);

    for (int i = 0; i < editedSkills.length; i++) {
      skillNameControllers
          .add(TextEditingController(text: editedSkills[i].name));
      skillPercentageControllers
          .add(TextEditingController(text: editedSkills[i].percentage));
      skillColorControllers.add(editedSkills[i].color);
    }

    trainingsCertificationsController.text =
        widget.currentTrainingsCertifications.join(', ');

    // Initialize education controllers with current education details
    for (int i = 0; i < widget.currentEducation.length; i++) {
      final education = widget.currentEducation[i];
      educationNameControllers.add(TextEditingController(text: education.name));
      educationYearControllers.add(TextEditingController(text: education.year));
      educationCertificateControllers
          .add(TextEditingController(text: education.certificate));
    }

    technicalProficienciesController.text =
        widget.currentTechnicalProficiencies.join(', ');

    for (int i = 0; i < widget.currentExperience.length; i++) {
      final experience = widget.currentExperience[i];
      experienceCompanyControllers
          .add(TextEditingController(text: experience.company));
      experienceRoleControllers
          .add(TextEditingController(text: experience.role));
      experienceYearControllers
          .add(TextEditingController(text: experience.year));
      experienceResponsibilityControllers
          .add(TextEditingController(text: experience.responsibility));
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
          return;
        }
        currentFocus.unfocus();
      },
      child: DefaultTabController(
        length: 3, // Number of tabs
        child: Scaffold(
          backgroundColor: kBackgroundColor,
          appBar: AppBar(
            backgroundColor: kBackgroundColor,
            title: const Text('Edit Your Profile Details'),
            bottom: const TabBar(
              tabs: [
                Tab(text: 'Personal'),
                Tab(text: 'Professional'),
                Tab(text: 'Educational'),
              ],
            ),
          ),
          body: TabBarView(children: [
            SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  ReusableTextFormField(
                    controller: nameController,
                    labelText: 'Name',
                  ),
                  ReusableTextFormField(
                    controller: slackNameController,
                    labelText: 'Slack Name',
                  ),
                  ReusableTextFormField(
                    controller: gitHubHandleController,
                    labelText: 'GitHub Handle',
                  ),
                  ReusableTextFormField(
                    controller: bioController,
                    labelText: 'Bio',
                  ),
                  ReusableTextFormField(
                    controller: interestsController,
                    labelText: 'Interests (comma-separated)',
                  ),
                  Column(
                    children: skillNameControllers.asMap().entries.map((entry) {
                      final index = entry.key;

                      return Padding(
                        padding: EdgeInsets.only(
                            bottom: getProportionateScreenHeight(16)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: getProportionateScreenWidth(240),
                              child: TextFormField(
                                controller: skillNameControllers[index],
                                style: appstyle(
                                  getProportionateScreenHeight(12),
                                  kWhiteColor,
                                  FontWeight.w500,
                                ),
                                decoration: InputDecoration(
                                  labelText: 'Skill Name',
                                  labelStyle: appstyle(
                                    getProportionateScreenHeight(14),
                                    kWhiteColor,
                                    FontWeight.w400,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      width: getProportionateScreenWidth(1),
                                      color: kWhiteColor,
                                    ),
                                    borderRadius: BorderRadius.circular(
                                        getProportionateScreenWidth(10)),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      width: getProportionateScreenWidth(1),
                                      color: kWhiteColor,
                                    ),
                                    borderRadius: BorderRadius.circular(
                                        getProportionateScreenWidth(10)),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      width: getProportionateScreenWidth(1),
                                      color: kWhiteColor,
                                    ),
                                    borderRadius: BorderRadius.circular(
                                        getProportionateScreenWidth(10)),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: getProportionateScreenWidth(80),
                              child: TextFormField(
                                controller: skillPercentageControllers[index],
                                style: appstyle(
                                  getProportionateScreenHeight(14),
                                  kWhiteColor,
                                  FontWeight.w500,
                                ),
                                decoration: InputDecoration(
                                  labelText: '%',
                                  labelStyle: appstyle(
                                    getProportionateScreenHeight(14),
                                    kWhiteColor,
                                    FontWeight.w400,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      width: getProportionateScreenWidth(1),
                                      color: kWhiteColor,
                                    ),
                                    borderRadius: BorderRadius.circular(
                                        getProportionateScreenWidth(10)),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      width: getProportionateScreenWidth(1),
                                      color: kWhiteColor,
                                    ),
                                    borderRadius: BorderRadius.circular(
                                        getProportionateScreenWidth(10)),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      width: getProportionateScreenWidth(1),
                                      color: kWhiteColor,
                                    ),
                                    borderRadius: BorderRadius.circular(
                                        getProportionateScreenWidth(10)),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                  DefaultButton(
                    text: ('Add Skill'),
                    press: () {
                      setState(() {
                        setState(() {
                          skillNameControllers.add(TextEditingController());
                          skillPercentageControllers
                              .add(TextEditingController());
                          skillColorControllers.add(Colors.red);
                        });
                      });
                    },
                  ),
                  const SizedBox(height: 20.0),
                ],
              ),
            ),
            SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  ReusableTextFormField(
                    controller: technicalProficienciesController,
                    labelText: 'Proficiencies (comma-separated)',
                  ),
                  Column(
                    children: experienceCompanyControllers
                        .asMap()
                        .entries
                        .map((entry) {
                      final index = entry.key;

                      return Column(
                        children: [
                          ReusableTextFormField(
                            controller: experienceCompanyControllers[index],
                            labelText: 'Company',
                          ),
                          ReusableTextFormField(
                            controller: experienceRoleControllers[index],
                            labelText: 'Role',
                          ),
                          ReusableTextFormField(
                            controller: experienceYearControllers[index],
                            labelText: 'Year',
                          ),
                          ReusableTextFormField(
                            controller:
                                experienceResponsibilityControllers[index],
                            labelText: 'Responsibility',
                          ),

                          SizedBox(
                              height:
                                  20.0), // Button to add new education detail
                        ],
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  ReusableTextFormField(
                    controller: trainingsCertificationsController,
                    labelText: 'Trainings and certifications (comma-separated)',
                  ),
                  Column(
                    children:
                        educationNameControllers.asMap().entries.map((entry) {
                      final index = entry.key;

                      return Column(
                        children: [
                          ReusableTextFormField(
                            controller: educationNameControllers[index],
                            labelText: 'School Name',
                          ),
                          ReusableTextFormField(
                            controller: educationCertificateControllers[index],
                            labelText: 'Certificate',
                          ),
                          ReusableTextFormField(
                            controller: educationYearControllers[index],
                            labelText: 'Year',
                          ),

                          SizedBox(
                              height:
                                  20.0), // Button to add new education detail
                        ],
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ]),
          floatingActionButton: SizedBox(
            height: getProportionateScreenHeight(70),
            width: getProportionateScreenWidth(70),
            child: FloatingActionButton(
              onPressed: () {
                // Save the edited data and navigate back to AboutMePage
                final updatedName = nameController.text;
                final updatedSlackName = slackNameController.text;
                final updatedGitHubURL = gitHubHandleController.text;

                final updatedBio = bioController.text;
                final updatedTrainingCertificates =
                    trainingsCertificationsController.text.split(', ').toList();

                List<Skill> newEditedSkills = [];

                for (int i = 0; i < skillNameControllers.length; i++) {
                  final skillName = skillNameControllers[i].text;
                  final skillPercentage = skillPercentageControllers[i].text;
                  final skillColor = skillColorControllers[i];

                  // Only add skills with non-empty names
                  if (skillName.isNotEmpty) {
                    newEditedSkills.add(
                      Skill(
                        name: skillName,
                        percentage: skillPercentage,
                        color: skillColor,
                      ),
                    );
                  }
                }

                editedSkills = newEditedSkills;
                final updatedInterests =
                    interestsController.text.split(', ').toList();

                final updatedEducationList = List<Education>.generate(
                  study.length,
                  (index) {
                    return Education(
                      name: educationNameControllers[index].text,
                      year: educationYearControllers[index].text,
                      certificate: educationCertificateControllers[index].text,
                    );
                  },
                );

                final updatedProficiences =
                    technicalProficienciesController.text.split(', ').toList();

                final updatedExperienceList = List<Experience>.generate(
                  work.length,
                  (index) {
                    return Experience(
                      company: experienceCompanyControllers[index].text,
                      year: experienceYearControllers[index].text,
                      role: experienceRoleControllers[index].text,
                      responsibility:
                          experienceResponsibilityControllers[index].text,
                    );
                  },
                );

                // Return the updated data to the previous screen
                Navigator.pop(context, {
                  'bio': updatedBio,
                  'interests': updatedInterests,
                  'name': updatedName,
                  'slackName': updatedSlackName,
                  'gitHubURL': updatedGitHubURL,
                  'skills': editedSkills,
                  'trainingsCertifications': updatedTrainingCertificates,
                  'educationList': updatedEducationList,
                  'technicalProficiences': updatedProficiences,
                  'experienceList': updatedExperienceList,
                });
              },
              backgroundColor: kPurpleColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.save,
                    size: getProportionateScreenWidth(16),
                  ),
                  Text(
                    'Save',
                    style: appstyle(
                      getProportionateScreenWidth(12),
                      kWhiteColor,
                      FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
