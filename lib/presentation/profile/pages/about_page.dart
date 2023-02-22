import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:icare_pro/application/core/colors.dart';
import 'package:icare_pro/application/core/spaces.dart';
import 'package:icare_pro/application/core/text_styles.dart';
import 'package:icare_pro/domain/value_objects/app_strings.dart';
import 'package:icare_pro/domain/value_objects/svg_asset_strings.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          aboutString,
          style: boldSize16Text(AppColors.blackColor),
        ),
        foregroundColor: AppColors.blackColor,
        backgroundColor: AppColors.whiteColor,
        shadowColor: AppColors.primaryColor.withOpacity(0.25),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: SizedBox(
                  width: 270,
                  height: 170,
                  child: FittedBox(
                    child: SvgPicture.asset(onlinePageSvg),
                  ),
                ),
              ),
              mediumVerticalSizedBox,
              Text(
                iCareProString,
                style: heavySize20Text(AppColors.blackColor),
              ),
              smallVerticalSizedBox,
              Text(
                appAboutString,
                style: normalSize14Text(AppColors.blackColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
