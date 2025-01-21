import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart'; // Import this
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:performance/login.dart';

void main() {
  runApp(const MyApp()); // Add this line to start the app
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // ignore: prefer_const_literals_to_create_immutables
      supportedLocales: [
        const Locale('en', 'US'),
        const Locale('ar', 'AE'),
      ],
      // ignore: prefer_const_literals_to_create_immutables
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: const Locale('ar'), // Set the locale to Arabic
      debugShowCheckedModeBanner: false,
      title: 'Performance',
      theme: ThemeData(
        textTheme: GoogleFonts.amiriTextTheme(),
      ),

      home: Login(),
    );
  }
}
