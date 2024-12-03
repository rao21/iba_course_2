import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:iba_course_2/main.dart'; // Import the main app where HomeScreen is defined.
Future<void> testExecutable(FutureOr<void> Function() testMain) async {
  return GoldenToolkit.runWithConfiguration(
    () async {
      await loadAppFonts();
      await testMain();
    },
    config: GoldenToolkitConfiguration(
      skipGoldenAssertion: () => !Platform.isMacOS,
    ),
  );
}

void main() {
  setUpAll(()async{
   await testExecutable((){});
  });
  testGoldens('Welcome Flutter card', (WidgetTester tester) async {
       var customWidget =  MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyApp(),
      );

      await tester.pumpWidgetBuilder(customWidget,
          surfaceSize: const Size(800, 800));
      await tester.pumpAndSettle(const Duration(seconds: 4));

      await screenMatchesGolden(tester, 'test_sc');
    });

}


Future<void> preloadMaterialFonts() async {
  final fontLoader = FontLoader('Roboto');
  fontLoader.addFont(rootBundle.load('packages/flutter/assets/Roboto-Regular.ttf'));
  fontLoader.addFont(rootBundle.load('packages/flutter/assets/Roboto-Medium.ttf'));
  await fontLoader.load();
}