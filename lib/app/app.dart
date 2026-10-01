import 'package:flutter/material.dart';
import 'package:strangestoreweb/app/app_theme.dart';
import 'package:strangestoreweb/features/home/presentation/home_screen.dart';

class StrangeStoreApp extends StatelessWidget {
  const StrangeStoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Strange Store',
      theme: AppTheme.lightTheme,
      home: const HomeScreen(),
    );
  }
}
