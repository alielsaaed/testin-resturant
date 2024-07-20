import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/font_size.dart';
import '../utils/theme_colors.dart';
import '../views/onboarding_screens.dart';
import '../views/sign_In.dart';

class IntroScreen extends StatelessWidget {
  static const String id = 'IntroScreen';

  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/intro.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(flex: 6),
              Row(
                children: [
                  Text(
                    'Find and Get\nYour Best Food',
                    style: GoogleFonts.roboto(
                      color: ThemeColors.whiteTextColor,
                      fontSize: FontSize.xxxLarge,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Text(
                    'Find the most delicious food\nwith the best quality and free delivery here',
                    style: GoogleFonts.roboto(
                      color: ThemeColors.whiteTextColor,
                      fontSize: FontSize.xMedium,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
              const Spacer(flex: 1),
              GestureDetector(
                onTap: () async {
                  SharedPreferences prefs = await SharedPreferences.getInstance();
                  await prefs.setBool('seenIntro', true);
                  Get.off(() => OnboardingScreens());
                },
                child: SvgPicture.asset("assets/images/next_button.svg"),
              ),
              const SizedBox(height: 30),
              TextButton(
                onPressed: () async {
                  SharedPreferences prefs = await SharedPreferences.getInstance();
                  await prefs.setBool('seenIntro', true);
                  Get.off(() => LoginPage());
                },
                child: Text(
                  'Skip',
                  style: GoogleFonts.roboto(
                    color: ThemeColors.whiteTextColor.withOpacity(0.5),
                    fontSize: FontSize.xMedium,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              const Spacer(flex: 1),
            ],
          ),
        ),
      ),
    );
  }
}
