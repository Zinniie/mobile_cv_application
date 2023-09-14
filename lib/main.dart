import 'package:flutter/material.dart';

import 'Pages/about_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CV Mobile',
      initialRoute: 'about',
      routes: {
        'about': (_) => const AboutMePage(),
      },
    );
  }
}