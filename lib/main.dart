import 'package:flutter/material.dart';
import 'package:kuliner_kita/theme/app_theme.dart';
import 'package:kuliner_kita/screens/login_screen.dart';

void main() {
  runApp(const KulinerKitaApp());
}

class KulinerKitaApp extends StatelessWidget {
  const KulinerKitaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KulinerKita',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      home: const LoginScreen(),
    );
  }
}