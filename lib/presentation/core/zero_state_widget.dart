import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:icare_pro/application/core/colors.dart';
import 'package:icare_pro/application/core/spaces.dart';
import 'package:icare_pro/application/core/text_styles.dart';
import 'package:icare_pro/domain/value_objects/app_strings.dart';
import 'package:icare_pro/domain/value_objects/svg_asset_strings.dart';
import 'package:icare_pro/presentation/core/icare_elevated_button.dart';

class ZeroStateWidget extends StatelessWidget {
  const ZeroStateWidget({
    super.key,
    required this.text,
    required this.onPressed,
  });

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.7,
              child: SvgPicture.asset(noNotificationSvg),
            ),
          ),
          mediumVerticalSizedBox,
          Text(
            text,
            style: boldSize18Text(AppColors.primaryColor),
          ),
          largeVerticalSizedBox,
          SizedBox(
            height: 40,
            width: MediaQuery.of(context).size.width * 0.7,
            child: ICareElevatedButton(
              text: okayThanksString,
              onPressed: onPressed,
            ),
          )
        ],
      ),
    );
  }
}
