import 'package:flutter/material.dart';

import '../Widgets/card_custom.dart';
import '../Widgets/lists_classes.dart';
import '../Widgets/names.dart';
import '../Widgets/progress_bar_custom.dart';
import '../ui/appstyle.dart';
import '../ui/constants.dart';
import '../utils/sizeconfig.dart';
import 'edit_profile_screen.dart';

class AboutMePage extends StatefulWidget {
  const AboutMePage({super.key});

  @override
  State<AboutMePage> createState() => _AboutMePageState();
}

class _AboutMePageState extends State<AboutMePage> {
  String selectedTab = 'aboutMe';
  String slackName = 'Zinniee'; // Define and initialize slackName
  String gitHubURL = 'Zinniie'; // Define and initialize gitHubURL
  String name = 'Ezinne Nnabugwu';
  String bio =
      "I am a software developer with over a year of experience in designing, developing, and deploying applications. I am passionate about learning and collaborating with great minds in the IT space. I thrive on challenges, I am a dedicated team player with excellent communication skills, and I am excited about further professional growth.";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Names(name: name, slackName: slackName, gitHubName: gitHubURL),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedTab = 'aboutMe';
                    });
                  },
                  child: Container(
                    // width: 100.0,
                    height: getProportionateScreenHeight(100),
                    width: getProportionateScreenWidth(100),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: selectedTab == 'aboutMe'
                          ? const Color(0xff1F1E25)
                          : const Color(0xff040305),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.person_outline_rounded,
                            color: Colors.white, size: 35),
                        Text(
                          'About Me',
                          style: appstyle(
                            getProportionateScreenHeight(14),
                            kWhiteColor,
                            FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedTab = 'experience';
                    });
                  },
                  child: Container(
                    height: getProportionateScreenHeight(100),
                    width: getProportionateScreenWidth(100),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: selectedTab == 'experience'
                          ? const Color(0xff1F1E25)
                          : const Color(0xff040305),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.work_outline_outlined,
                            color: Colors.white, size: 35),
                        Text(
                          'Experience',
                          style: appstyle(
                            getProportionateScreenHeight(14),
                            kWhiteColor,
                            FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedTab = 'education';
                    });
                  },
                  child: Container(
                    height: getProportionateScreenHeight(100),
                    width: getProportionateScreenWidth(100),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: selectedTab == 'education'
                          ? const Color(0xff1F1E25)
                          : const Color(0xff040305),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.stacked_line_chart_sharp,
                            color: Colors.white, size: 35),
                        Text(
                          'Education',
                          style: appstyle(
                            getProportionateScreenHeight(14),
                            kWhiteColor,
                            FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            selectedTab == 'aboutMe'
                ? SizedBox(
                    height: getProportionateScreenHeight(530),
                    child: ListView(shrinkWrap: true, children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: getProportionateScreenWidth(16)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: getProportionateScreenHeight(15)),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 10.0),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: const Color(0xff1F1E25),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                      height: getProportionateScreenHeight(15)),
                                  Text(
                                    bio,
                                    style: appstyle(
                                      getProportionateScreenHeight(14),
                                      kWhiteColor,
                                      FontWeight.w400,
                                    ),
                                  ),
                                  SizedBox(
                                      height: getProportionateScreenHeight(20)),
                                  const Text('Skills',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18)),
                                  SizedBox(
                                      height: getProportionateScreenHeight(10)),
                                  ListView.builder(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount: skills.length,
                                    itemBuilder: (context, index) {
                                      final skill = skills[index];
                                      return ProgressBarCustom(
                                        skill: skill.name,
                                        percentage: skill.percentage,
                                        color: skill.color,
                                        // progressGauge: skill.progressGauge,
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 15.0),
                            const Text('Interests',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18)),
                            const SizedBox(height: 15.0),
                            ListView.builder(
                              shrinkWrap: true,
                              itemCount: interests.length,
                              itemBuilder: (context, index) {
                                final interest = interests[index];
                                return Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          bottom:
                                              getProportionateScreenHeight(10)),
                                      child: Container(
                                        padding: const EdgeInsets.all(15.0),
                                        decoration: BoxDecoration(
                                          color: const Color(0xff1F1E25),
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                        child: Text(
                                          interest,
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 15),
                                        ),
                                      ),
                                    ),
                                    if (index <
                                        interests.length -
                                            1) // Add spacing between interests
                                      const SizedBox(width: 10.0),
                                  ],
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ]),
                  )
                : selectedTab == 'experience'
                    ? SizedBox(
                        height: getProportionateScreenHeight(530),
                        child: ListView(shrinkWrap: true, children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: getProportionateScreenWidth(16)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                    height: getProportionateScreenHeight(15)),
                                ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: work.length,
                                  itemBuilder: (context, index) {
                                    final job = work[index];
                                    return Padding(
                                      padding: EdgeInsets.only(
                                          bottom:
                                              getProportionateScreenHeight(10)),
                                      child: Container(
                                          padding: EdgeInsets.symmetric(
                                              vertical:
                                                  getProportionateScreenHeight(
                                                      6)),
                                          decoration: BoxDecoration(
                                              color: const Color(0xff1F1E25),
                                              borderRadius:
                                                  BorderRadius.circular(20.0)),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              ListTile(
                                                leading: Container(
                                                  height: 45,
                                                  width: 45,
                                                  decoration: BoxDecoration(
                                                      color: Color(0xffA36FF6),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15.0)),
                                                  child: const Icon(
                                                      Icons
                                                          .work_outline_outlined,
                                                      color: Colors.white),
                                                ),
                                                title: Text(
                                                  job.company,
                                                  style: appstyle(
                                                    getProportionateScreenWidth(
                                                        11),
                                                    kWhiteColor,
                                                    FontWeight.w500,
                                                  ),
                                                ),
                                                subtitle: Column(
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          job.role,
                                                          style: appstyle(
                                                            getProportionateScreenWidth(
                                                                11),
                                                            kWhiteColor,
                                                            FontWeight.w500,
                                                          ),
                                                        ),
                                                        Text(
                                                          job.year,
                                                          style: appstyle(
                                                            getProportionateScreenWidth(
                                                                11),
                                                            kWhiteColor,
                                                            FontWeight.w500,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Text(
                                                      job.responsibility,
                                                      style: appstyle(
                                                        getProportionateScreenWidth(
                                                            11),
                                                        Colors.grey,
                                                        FontWeight.w500,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          )),
                                    );
                                    // CardCustom(
                                    //   text: job.company,
                                    //   colorIcon: const Color(0xffA36FF6),

                                    //   education: job.role,
                                    //   year: job.responsibility,
                                    //   // progressGauge: skill.progressGauge,
                                    // );
                                  },
                                ),
                                Text('Proficiencies',
                                    style: appstyle(
                                        getProportionateScreenWidth(14),
                                        Colors.white,
                                        FontWeight.w500)),
                                const SizedBox(height: 15.0),
                                ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: technicalProficiencies.length,
                                  itemBuilder: (context, index) {
                                    final proficiencies =
                                        technicalProficiencies[index];
                                    return Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              bottom:
                                                  getProportionateScreenHeight(
                                                      10)),
                                          child: Container(
                                            padding: const EdgeInsets.all(15.0),
                                            decoration: BoxDecoration(
                                              color: const Color(0xff1F1E25),
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                            ),
                                            child: Text(
                                              proficiencies,
                                              style: appstyle(
                                                getProportionateScreenHeight(
                                                    12),
                                                kWhiteColor,
                                                FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                        ),
                                        if (index <
                                            technicalProficiencies.length -
                                                1) // Add spacing between interests
                                          const SizedBox(width: 10.0),
                                      ],
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ]),
                      )
                    : SizedBox(
                        height: getProportionateScreenHeight(530),
                        child: ListView(shrinkWrap: true, children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: getProportionateScreenWidth(16)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                    height: getProportionateScreenHeight(15)),
                                ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: study.length,
                                  itemBuilder: (context, index) {
                                    final studied = study[index];
                                    return CardCustom(
                                      text: studied.name,
                                      colorIcon: const Color(0xffA36FF6),

                                      education: studied.certificate,
                                      year: studied.year,
                                      // progressGauge: skill.progressGauge,
                                    );
                                  },
                                ),
                                Text('Trainings and Certifications',
                                    style: appstyle(
                                        getProportionateScreenWidth(14),
                                        Colors.white,
                                        FontWeight.w500)),
                                const SizedBox(height: 15.0),
                                ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: trainingsCertifications.length,
                                  itemBuilder: (context, index) {
                                    final interest =
                                        trainingsCertifications[index];
                                    return Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              bottom:
                                                  getProportionateScreenHeight(
                                                      10)),
                                          child: Container(
                                            padding: const EdgeInsets.all(15.0),
                                            decoration: BoxDecoration(
                                              color: const Color(0xff1F1E25),
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                            ),
                                            child: Text(
                                              interest,
                                              style: appstyle(
                                                getProportionateScreenHeight(
                                                    12),
                                                kWhiteColor,
                                                FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                        ),
                                        if (index <
                                            trainingsCertifications.length -
                                                1) // Add spacing between interests
                                          const SizedBox(width: 10.0),
                                      ],
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ]),
                      )
          ],
        ),
      ),
      floatingActionButton: SizedBox(
        height: getProportionateScreenHeight(85),
        width: getProportionateScreenWidth(85),
        child: FloatingActionButton(
          onPressed: () async {
            final updatedData = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => EditProfileScreen(
                  currentName: name, // Pass the current name
                  currentSlackName: slackName, // Pass the current Slack name
                  currentGitHubURL: gitHubURL, // Pass the current GitHub URL
                  currentBio: bio,
                  currentInterests: interests,
                  currentSkills: skills, // Pass the current skills
                  currentTrainingsCertifications: trainingsCertifications,
                  currentEducation: study,
                  currentTechnicalProficiencies: technicalProficiencies,
                  currentExperience: work,

                  // Pass other current data properties
                ),
              ),
            );

            if (updatedData != null) {
              setState(() {
                bio = updatedData['bio'];
                interests = updatedData['interests'];
                name = updatedData['name']; // Update the name
                slackName = updatedData['slackName']; // Update the Slack name
                gitHubURL = updatedData['gitHubURL']; // Update the GitHub URL
                skills = updatedData['skills']; // Update the skills
                trainingsCertifications =
                    updatedData['trainingsCertifications'];
                study = updatedData['educationList'];
                technicalProficiencies = updatedData['technicalProficiences'];
                work = updatedData['experienceList'];
                // Update the
                // Update other data properties
              });
            }
          },
          backgroundColor: kPurpleColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.edit,
                size: getProportionateScreenWidth(16),
              ),
              Text(
                'Edit',
                style: appstyle(
                  getProportionateScreenWidth(12),
                  kWhiteColor,
                  FontWeight.w600,
                ),
              ),
              Text(
                'Details',
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
    );
  }
}
