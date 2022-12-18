import 'package:flutter/material.dart';
import 'package:parcel_delivery_app/core/themes.dart';
import 'package:parcel_delivery_app/pages/home/home_screen.dart';

import 'core/strings.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      theme: AppThemes.lightTheme,
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}
