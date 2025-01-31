import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import '/Controllers/auth-controller.dart';
import '/services/validators.dart';
import '/utils/font_size.dart';
import '/utils/size_config.dart';
import '/views/sign_In.dart';
import '/widgets/loader.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '/utils/theme_colors.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();

  AuthController controller = AuthController();
  Validators validators = Validators();

  @override
  void didChangeDependencies() {
    controller = Get.put(AuthController());
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig sizeConfig = SizeConfig();
    sizeConfig.init(context);

    return GetBuilder<AuthController>(
      init: AuthController(),
      builder: (auth) => Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Container(
            height: SizeConfig.screenHeight,
            padding: const EdgeInsets.all(30),
            child: Stack(
              children: [
                Column(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Image.asset(
                      'assets/images/Logo.png',
                      height: 200,
                      width: 200,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Hello! Create Account",
                      style: GoogleFonts.dmSans(
                        color: ThemeColors.titleColor,
                        fontSize: FontSize.xxLarge,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have an account? ',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.dmSans(
                            color: ThemeColors.greyTextColor,
                            fontSize: FontSize.medium,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.to(LoginPage());
                          },
                          child: Text(
                            'Sign in',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.dmSans(
                              color: ThemeColors.baseThemeColor,
                              fontSize: FontSize.medium,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    Expanded(
                      child: Form(
                        key: _formKey,
                        child: ListView(
                          children: [
                            ///Name Input Field
                            TextFormField(
                              controller: controller.nameController,
                              style: GoogleFonts.poppins(
                                color: Colors.black,
                              ),
                              keyboardType: TextInputType.name,
                              cursorColor: ThemeColors.primaryColor,
                              decoration: InputDecoration(
                                //fillColor: ThemeColors.textFieldBgColor,
                                filled: true,
                                hintText: "Full name",
                                hintStyle: GoogleFonts.poppins(
                                  color: ThemeColors.textFieldHintColor,
                                  fontSize: FontSize.medium,
                                  fontWeight: FontWeight.w400,
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(18)),
                                ),
                              ),
                            ),
                            SizedBox(height: 16),

                            ///E-mail Input Field
                            TextFormField(
                              controller: controller.emailController,
                              style: GoogleFonts.poppins(
                                color: Colors.black,
                              ),
                              cursorColor: ThemeColors.primaryColor,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                //fillColor: ThemeColors.textFieldBgColor,
                                filled: true,
                                hintText: "E-mail",
                                hintStyle: GoogleFonts.poppins(
                                  color: ThemeColors.textFieldHintColor,
                                  fontSize: FontSize.medium,
                                  fontWeight: FontWeight.w400,
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(18)),
                                ),
                              ),
                            ),
                            SizedBox(height: 16),

                            ///Phone Input Field
                            TextFormField(
                              controller: controller.phoneController,
                              style: GoogleFonts.poppins(
                                color: Colors.black,
                              ),
                              cursorColor: ThemeColors.primaryColor,
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                // fillColor: ThemeColors.textFieldBgColor,
                                filled: true,
                                hintText: "Phone number",
                                hintStyle: GoogleFonts.poppins(
                                  color: ThemeColors.textFieldHintColor,
                                  fontSize: FontSize.medium,
                                  fontWeight: FontWeight.w400,
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(18)),
                                ),
                              ),
                            ),
                            SizedBox(height: 16),

                            ///Password Input Field
                            TextFormField(
                              controller: controller.passwordController,
                              obscureText: true,
                              style: GoogleFonts.poppins(
                                color: Colors.black,
                              ),
                              keyboardType: TextInputType.visiblePassword,
                              cursorColor: ThemeColors.primaryColor,
                              decoration: InputDecoration(
                                //  fillColor: ThemeColors.textFieldBgColor,
                                filled: true,
                                hintText: "Password",
                                hintStyle: GoogleFonts.poppins(
                                  color: ThemeColors.textFieldHintColor,
                                  fontSize: FontSize.medium,
                                  fontWeight: FontWeight.w400,
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(18)),
                                ),
                              ),
                            ),
                            SizedBox(height: 30),

                            ///Password confirmation Input Field
                            TextFormField(
                              controller:
                                  controller.passwordConfirmationController,
                              obscureText: true,
                              style: GoogleFonts.poppins(
                                color: Colors.black,
                              ),
                              keyboardType: TextInputType.visiblePassword,
                              cursorColor: ThemeColors.primaryColor,
                              decoration: InputDecoration(
                                //  fillColor: ThemeColors.textFieldBgColor,
                                filled: true,
                                hintText: "Confirm Password",
                                hintStyle: GoogleFonts.poppins(
                                  color: ThemeColors.textFieldHintColor,
                                  fontSize: FontSize.medium,
                                  fontWeight: FontWeight.w400,
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(18)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              ThemeColors.baseThemeColor, // background
                          foregroundColor: Colors.white, // foreground
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(18), // <-- Radius
                          ),
                        ),
                        onPressed: () => controller.signupOnTap(
                          context: context,
                          email:
                              controller.emailController.text.toString().trim(),
                          password: controller.passwordController.text
                              .toString()
                              .trim(),
                          phoneNumber:
                              controller.phoneController.text.toString().trim(),
                          name:
                              controller.nameController.text.toString().trim(),
                          confirmPassword: controller
                              .passwordConfirmationController.text
                              .toString()
                              .trim(),
                        ),
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already a user? ",
                            style: GoogleFonts.poppins(
                              // color: ThemeColors.whiteTextColor,
                              fontSize: FontSize.medium,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          GestureDetector(
                            onTap: () => Get.to(LoginPage()),
                            child: Text(
                              "Sign In",
                              style: GoogleFonts.poppins(
                                color: ThemeColors.baseThemeColor,
                                fontSize: FontSize.medium,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                auth.loader
                    ? Positioned(
                        child: Container(
                            height: MediaQuery.of(context).size.height,
                            width: MediaQuery.of(context).size.width,
                            color: Colors.white60,
                            child: Center(child: Loader())),
                      )
                    : SizedBox.shrink(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
