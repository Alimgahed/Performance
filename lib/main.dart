import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart'; // Import this
import 'package:get/get.dart';
import 'package:performance/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      locale: const Locale('ar'), // Set the locale to Arabic
      debugShowCheckedModeBanner: false,
      title: 'Performance',
      theme: ThemeData(
        appBarTheme: AppBarTheme(backgroundColor: Colors.blue),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Home(),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('ar'), // Add Arabic as a supported locale
      ],
    );
  }
}
