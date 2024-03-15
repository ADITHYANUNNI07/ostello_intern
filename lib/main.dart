import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ostello/core/color/color.dart';
import 'package:ostello/presentation/onboard%20screen/onboard_screen.dart';

void main(List<String> args) async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: customPrimaryColor,
        scaffoldBackgroundColor: const Color(0XFFFFF6FF),
        primaryColor: const Color(0xFF773BFF),
        iconTheme: const IconThemeData(color: Color(0xFF773BFF)),
        buttonTheme: const ButtonThemeData(
          textTheme: ButtonTextTheme.primary,
          buttonColor: Color(0xFF773BFF),
        ),
        textTheme: GoogleFonts.poppinsTextTheme()
            .apply(bodyColor: Colors.black, displayColor: Colors.white),
      ),
      home: const OnboardScrn(),
    );
  }
}
