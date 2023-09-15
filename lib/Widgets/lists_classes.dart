import 'package:flutter/material.dart';

List<String> interests = [
  'Fullstack Development',
  'Project Management',
  'UI/UX Design',
  'Data Science',
];

List<String> trainingsCertifications = [
  'I4GXZURI Software Development',
  'Diplômé d’études en langue française 2 (DELF A2)',
  'Diplômé d’études en langue française 2 (DELF A1)',
];

class Education {
  final String name;
  final String year;
  final String certificate;

  Education({
    required this.name,
    required this.year,
    required this.certificate,
  });
}

List<Education> study = [
  Education(
    name: 'University of Lagos, Akoka, Lagos State. ',
    year: '2019 - 2022',
    certificate: 'Masters in International Law and Diplomacy.',
  ),
  Education(
    name: 'Houdegbe North American University, Benin.',
    year: '2013 - 2016',
    certificate: 'B.A. International Relations.',
  ),
  Education(
    name: 'Baptist Model High School, Ikola Lagos State.',
    year: '2007 - 2013',
    certificate: 'SSCE',
  ),
];

class Experience {
  final String company;
  final String role;
  final String year;
  final String responsibility;

  Experience({
    required this.company,
    required this.role,
    required this.responsibility,
    required this.year,
  });
}

List<Experience> work = [
  Experience(
    company: 'Nabkon Auto Solutions Limited. ',
    role: 'Customer Support Officer',
    year: 'Jan 2019 - May 2022',
    responsibility:
        'Prioritized delivering outstanding customer experience with a positive and empathetic approach. I maintained customer records and provided information on our products while efficiently managing emails and calls. I successfully met targets, reduced cancellations by 5% through a new strategy, and resolved technical issues for clients at a 90% rate.',
  ),
  Experience(
    company: 'I4G x Zuri Internship',
    role: 'Intern',
    year: 'May 2022 - Aug 2022',
    responsibility:
        'During my internship in fullstack software development, I gained diverse skills, including developing a file comparison platform with React JS, creating a responsive portfolio website with HTML and CSS, building a Todo app using Django, crafting a simple calculator and countdown timer in JavaScript, developing a library management app with Django Rest Framework and so much more. You can explore my projects on my GitHub profile: https://github.com/zinniie.',
  ),
  Experience(
    company: 'FuelMetrics Limited',
    role: 'Mobile Developer ',
    year: 'Aug 2022 - till date',
    responsibility:
        'I began as an intern in Frontend Web Development and later transitioned to Mobile Development, eventually securing a position as a full-time employee. My experience has involved constructing mobile applications utilizing Flutter and Dart, significantly advancing team productivity through effective use of ClickUp. Collaboration with UI/UX specialists has been a key aspect, ensuring seamless integration of usability and accessibility in the software. As a mobile developer, my responsibilities encompasses overseeing the entire code base, analyzing project requirements to develop functional application components, implementing program logic based on specifications, incorporating feedback from code reviews to meet established standards, interacting with REST API via HTTP client, and successfully deploying the mobile application to both IOS AppStore and Google PlayStore.',
  ),
];

List<String> technicalProficiencies = [
  'Microsoft Office Suite (Word, Excel & PowerPoint).',
  'Search Engine Optimization',
  'Digital Marketing',
  'CRM Software (Salesforce).',
  'WordPress',
];

class Skill {
  final String name;
  final String percentage;
  final Color color;
  final double progressGauge;

  Skill({
    required this.name,
    required this.percentage,
    required this.color,
  }) : progressGauge = calculateProgressGauge(percentage);
  static double calculateProgressGauge(String percentage) {
    // Convert the percentage to a double (e.g., '95' to 0.95)
    double parsedPercentage = double.tryParse(percentage) ?? 0.0;

    // Map the percentage to the progressGauge within a desired range
    double minPercentage = 0.0;
    double maxPercentage = 100.0;
    double minProgressGauge = 100.0;
    double maxProgressGauge = 300.0;

    double normalizedPercentage =
        (parsedPercentage - minPercentage) / (maxPercentage - minPercentage);
    double calculatedProgressGauge = minProgressGauge +
        normalizedPercentage * (maxProgressGauge - minProgressGauge);

    return calculatedProgressGauge;
  }
}

List<Skill> skills = [
  Skill(
      name: 'Mobile App Development(Flutter)',
      percentage: '70',
      color: const Color(
        0xffA36FF6,
      )),
  Skill(
    name: 'Frontend Web Development',
    percentage: '45',
    color: const Color(0xff83DBC5),
  ),
  Skill(
    name: 'Backend Development',
    percentage: '25',
    color: const Color(0xff0385DC),
  ),
  Skill(
    name: 'Product Design',
    percentage: '30',
    color: const Color(0xffF7605D),
  ),
];
