import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_ex/views/custom_sign_in_button.dart';
import '/Controllers/auth-controller.dart';
import '/Controllers/global-controller.dart';
import '/services/get_network_manager.dart';
import '/utils/font_size.dart';
import '/utils/size_config.dart';
import '/views/no_internet.dart';
import '/views/sign_up.dart';
import '/widgets/loader.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '/utils/theme_colors.dart';
import 'package:shimmer/shimmer.dart';

import 'otp_login_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with WidgetsBindingObserver {
  final settingController = Get.put(GlobalController());

  GetXNetworkManager _networkManager = GetXNetworkManager();

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // TODO: implement didChangeAppLifecycleState

    switch (state) {
      case AppLifecycleState.inactive:
      case AppLifecycleState.hidden:
        break;
      case AppLifecycleState.resumed:
        break;
      case AppLifecycleState.detached:
        break;

      case AppLifecycleState.paused:
        // TODO: Handle this case.
        break;
    }
    super.didChangeAppLifecycleState(state);
  }

  final _formKey = GlobalKey<FormState>();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  AuthController authController = AuthController();

  @override
  void didChangeDependencies() {
    _networkManager = Get.put(GetXNetworkManager());
    authController = Get.put(AuthController());
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig sizeConfig = SizeConfig();
    sizeConfig.init(context);
    return GetBuilder<GetXNetworkManager>(
      builder: (builder) => (_networkManager.connectionType == 0)
          ? NoInternetPage()
          : GetBuilder<AuthController>(
              init: AuthController(),
              builder: (auth) => Scaffold(
                backgroundColor: Colors.white,
                body: SafeArea(
                    child: Container(
                  height: SizeConfig.screenHeight,
                  width: SizeConfig.screenWidth,
                  padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                  child: Stack(children: [
                    Center(
                      child: SingleChildScrollView(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset(
                                'assets/images/Logo.png',
                                height: 200,
                                width: 200,
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              Text(
                                "Welcome Back",
                                style: GoogleFonts.dmSans(
                                  color: ThemeColors.titleColor,
                                  fontSize: FontSize.xxLarge,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                'Hello, sign in to continue!',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.dmSans(
                                  color: ThemeColors.greyTextColor,
                                  fontSize: FontSize.medium,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Or ',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.dmSans(
                                      color: ThemeColors.greyTextColor,
                                      fontSize: FontSize.medium,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Get.off(() => SignUpPage());
                                    },
                                    child: Text(
                                      ' Create new account',
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.dmSans(
                                        color: ThemeColors.baseThemeColor,
                                        fontSize: FontSize.medium,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 30),
                              Form(
                                key: _formKey,
                                child: Column(
                                  children: [
                                    ///Email Input Field
                                    Container(
                                      height: 60,
                                      child: TextFormField(
                                        controller: _emailController,
                                        validator: (value) {
                                          if (_emailController.text.isEmpty) {
                                            return "This field can't be empty";
                                          }
                                          return null;
                                        },
                                        style: GoogleFonts.dmSans(
                                          color: Colors.black,
                                        ),
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        cursorColor: ThemeColors.primaryColor,
                                        decoration: InputDecoration(
                                          labelText: 'Email Address',
                                          labelStyle: TextStyle(
                                              color: Colors.grey, fontSize: 15),
                                          hintText: 'Enter your email here',
                                          hintStyle: TextStyle(
                                              color: Colors.grey, fontSize: 15),
                                          prefixIcon: Icon(
                                            Icons.email_outlined,
                                            color: ThemeColors.baseThemeColor,
                                          ),
                                          fillColor: Colors.black,
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            borderSide: BorderSide(
                                              color: ThemeColors.baseThemeColor,
                                            ),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            borderSide: BorderSide(
                                              width: 0.2,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 16),

                                    ///Password Input Field
                                    Container(
                                      height: 60,
                                      child: TextFormField(
                                        controller: _passwordController,
                                        validator: (value) {
                                          if (_passwordController
                                              .text.isEmpty) {
                                            return "This field can't be empty";
                                          }
                                          return null;
                                        },
                                        obscureText: true,
                                        style: GoogleFonts.dmSans(
                                          color: Colors.black,
                                        ),
                                        keyboardType:
                                            TextInputType.visiblePassword,
                                        cursorColor: ThemeColors.primaryColor,
                                        decoration: InputDecoration(
                                          labelText: 'Password',
                                          labelStyle: TextStyle(
                                              color: Colors.grey, fontSize: 15),
                                          hintText: 'Enter your password here',
                                          hintStyle: TextStyle(
                                              color: Colors.grey, fontSize: 15),
                                          prefixIcon: Icon(
                                            Icons.lock,
                                            color: ThemeColors.baseThemeColor,
                                          ),
                                          fillColor: Colors.black,
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            borderSide: BorderSide(
                                              color: ThemeColors.baseThemeColor,
                                            ),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            borderSide: BorderSide(
                                              width: 0.2,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 20),

                                    ///Sign in button
                                    Container(
                                      height: 50,
                                      width: double.infinity,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: ThemeColors
                                              .baseThemeColor, // background
                                          foregroundColor:
                                              Colors.white, // foreground
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                10), // <-- Radius
                                          ),
                                        ),
                                        onPressed: () async {
                                          auth.loginOnTap(
                                              email: _emailController.text
                                                  .toString()
                                                  .trim(),
                                              pass: _passwordController.text
                                                  .toString()
                                                  .trim());
                                        },
                                        child: Text(
                                          'Sign In',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      Get.to(() => OtpLoginPage());
                                    },
                                    child: Text(
                                      'Forget Password?',
                                      style: TextStyle(
                                        color: ThemeColors.baseThemeColor,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 20),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "OR",
                                          style: GoogleFonts.dmSans(
                                            // color: ThemeColors.whiteTextColor,
                                            fontSize: FontSize.medium,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomSignInButton(
                                    icon: const Icon(
                                      Icons.facebook,
                                      color: Colors.blue,
                                    ),
                                    text: 'Connect with Facebook',
                                    containerColor: const Color(0xff1877F2)
                                        .withOpacity(0.05),
                                    onTap: () {
                                      auth.loginFB();
                                    },
                                  ),
                                  SizedBox(height: 20),
                                  CustomSignInButton(
                                    icon: SvgPicture.asset(
                                        "assets/images/Google.svg"),
                                    text: "Connect with Google",
                                    containerColor: ThemeColors.greyTextColor
                                        .withOpacity(0.13),
                                    onTap: () {
                                      auth.loginGoogle();
                                    },
                                  ),
                                ],
                              ),
                            ]),
                      ),
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
                  ]),
                )),
              ),
            ),
    );
  }
}
