import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:icare_pro/application/core/colors.dart';
import 'package:icare_pro/application/core/spaces.dart';
import 'package:icare_pro/application/core/text_styles.dart';
import 'package:icare_pro/domain/value_objects/app_strings.dart';
import 'package:icare_pro/domain/value_objects/svg_asset_strings.dart';
import 'package:icare_pro/presentation/core/icare_elevated_button.dart';
import 'package:icare_pro/presentation/core/icare_text_button.dart';
import 'package:icare_pro/presentation/core/icare_text_form_field.dart';
import 'package:icare_pro/presentation/core/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    Key? key,
    required this.signUp,
  }) : super(key: key);
  final VoidCallback signUp;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late bool _showPassword;

  @override
  void initState() {
    super.initState();
    _showPassword = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColorLight,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              smallVerticalSizedBox,
              Center(
                child: SvgPicture.asset(accessAccountSvg),
              ),
              largeVerticalSizedBox,
              Text(
                welcomeString,
                style: boldSize30Text(
                  AppColors.primaryColor,
                ),
              ),
              largeVerticalSizedBox,
              Form(
                child: Column(
                  children: [
                    const ICareTextFormField(
                      label: phoneNumberString,
                      prefixIcon: Icons.phone,
                      hintText: phoneNumberHintString,
                      fillColor: AppColors.whiteColor,
                    ),
                    mediumVerticalSizedBox,
                    ICareTextFormField(
                      label: passwordString,
                      prefixIcon: Icons.lock,
                      hintText: passwordHintString,
                      fillColor: AppColors.whiteColor,
                      obscureText: !_showPassword,
                      suffixIcon: _showPassword
                          ? Icons.visibility
                          : Icons.visibility_off,
                      suffixOnPressed: () {
                        setState(() {
                          _showPassword = !_showPassword;
                        });
                      },
                    ),
                    smallVerticalSizedBox,
                    ICareTextButton(
                      onPressed: () => Navigator.of(context)
                          .pushNamed(AppRoutes.forgotPassword),
                      text: forgotPasswordString,
                      style: boldSize16Text(AppColors.primaryColor),
                    ),
                    smallVerticalSizedBox,
                    SizedBox(
                      height: 48,
                      width: double.infinity,
                      child: ICareElevatedButton(
                        onPressed: () async {
                          final prefs = await SharedPreferences.getInstance();
                          prefs.setBool('showHome', true);
                          Navigator.of(context)
                              .pushReplacementNamed(AppRoutes.tabAppointment);
                        },
                        text: signInString,
                      ),
                    ),
                    smallVerticalSizedBox,
                    Text(
                      orString,
                      textAlign: TextAlign.center,
                      style: normalSize14Text(AppColors.greyTextColor),
                    ),
                    smallVerticalSizedBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: SvgPicture.asset(googleIconSvg),
                          onPressed: () {},
                        ),
                        largeHorizontalSizedBox,
                        IconButton(
                          icon: SvgPicture.asset(facebookIconSvg),
                          onPressed: () {},
                        ),
                      ],
                    ),
                    smallVerticalSizedBox,
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: dontHaveAccountString,
                            style: normalSize12Text(
                              AppColors.blackColor,
                            ),
                          ),
                          TextSpan(
                            text: signUpString,
                            style: normalSize12Text(
                              AppColors.primaryColor,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = widget.signUp,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
