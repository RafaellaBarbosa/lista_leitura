import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: AppRoutes.rotas,
      theme: ThemeData(
        primaryColor: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: GoogleFonts.kalamTextTheme(Theme.of(context).textTheme),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color(0xfff1ef88),
        ),
        useMaterial3: true,
      ),
    );
  }
}
