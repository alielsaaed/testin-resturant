import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/font_size.dart';
import '../utils/theme_colors.dart';

class CustomSignInButton extends StatelessWidget {
  final Color containerColor;
  final Widget icon;
  final String text;
  final void Function()? onTap;

  const CustomSignInButton(
      {super.key,
      required this.icon,
      required this.text,
      required this.containerColor,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: containerColor,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.transparent),
        ),
        child: ListTile(
          leading: icon,
          title: Center(
              child: Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Text(
              text,
              style: GoogleFonts.dmSans(
                color: ThemeColors.titleColor,
                fontSize: FontSize.xMedium,
                fontWeight: FontWeight.normal,
              ),
            ),
          )),
        ),
      ),
    );
  }
}
