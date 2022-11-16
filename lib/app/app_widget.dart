import 'package:api_example_flutter/app/modules/home/home_page.dart';
import 'package:flutter/material.dart';

import 'modules/bible/pages/bible_page.dart';
import 'modules/dogs/pages/dogs_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => const HomePage(),
        '/dogs': (context) => const DogsPage(),
        '/bible': (context) => const BiblePage(),
      },
    );
  }
}
