import 'package:flutter/material.dart';
import 'package:iba_course_2/lect1/list_view.dart';
import 'package:iba_course_2/lect_2/list_api.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        appBarTheme: AppBarTheme(),
        useMaterial3: false,
      ),
      home: const PostListUser(),
    );
  }
}
