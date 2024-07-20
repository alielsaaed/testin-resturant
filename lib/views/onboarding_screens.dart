import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/font_size.dart';
import '../utils/theme_colors.dart';
import '../widgets/authentication.dart';
import 'onboarding_content.dart';

class OnboardingScreens extends StatefulWidget {
  static const String id = 'OnboardingScreens';

  const OnboardingScreens({super.key});

  @override
  State<OnboardingScreens> createState() => OnBoardingScreenState();
}

class OnBoardingScreenState extends State<OnboardingScreens> {
  int currentIndex = 0;
  PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: PageView.builder(
              controller: controller,
              itemCount: contents.length,
              onPageChanged: (int index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemBuilder: (_, i) {
                return Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Spacer(flex: 6),
                      Image.asset(
                        contents[i].image,
                        height: 300,
                      ),
                      const Spacer(flex: 2),
                      Text(
                        contents[i].title,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.dmSans(
                          color: ThemeColors.titleColor,
                          fontSize: FontSize.xxLarge,
                          fontWeight: FontWeight.bold,
                        ),                      ),
                      const SizedBox(height: 20),
                      Text(
                        contents[i].desc,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.dmSans(
                          color: ThemeColors.greyTextColor,
                          fontSize: FontSize.medium,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      const Spacer(flex: 2),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          contents.length,
                              (index) => buildDot(index, context),
                        ),
                      ),
                      const Spacer(flex: 2),
                      Container(
                        height: 50,
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: ThemeColors.baseThemeColor, // background
                            foregroundColor: Colors.white, // foreground
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15), // <-- Radius
                            ),
                          ),
                          onPressed: () async {
                            if (currentIndex == contents.length - 1) {
                              SharedPreferences prefs = await SharedPreferences.getInstance();
                              await prefs.setBool('seenOnboarding', true);
                              Get.off(() => Authentication());
                            } else {
                              controller.nextPage(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              );
                            }
                          },
                          child: Text(
                            currentIndex == contents.length - 1 ? 'Get Started' : 'Next',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const Spacer(flex: 2),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDot(int index, BuildContext context) {
    return Container(
      height: 6,
      width: currentIndex == index ? 35 : 10,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: currentIndex == index ? ThemeColors.baseThemeColor : Colors.grey,
      ),
    );
  }
}
