import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:icare_pro/application/core/colors.dart';
import 'package:icare_pro/application/core/text_styles.dart';
import 'package:icare_pro/domain/value_objects/app_strings.dart';
import 'package:icare_pro/domain/value_objects/svg_asset_strings.dart';
import 'package:icare_pro/presentation/core/routes.dart';
import 'package:icare_pro/presentation/home/pages/canceled_appointments_page.dart';
import 'package:icare_pro/presentation/home/pages/past_appointment_page.dart';
import 'package:icare_pro/presentation/home/pages/upcoming_appointment_page.dart';

class TabAppointmentPage extends StatefulWidget {
  const TabAppointmentPage({super.key});

  @override
  State<TabAppointmentPage> createState() => _TabAppointmentPageState();
}

class _TabAppointmentPageState extends State<TabAppointmentPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: NestedScrollView(
        headerSliverBuilder: (context, value) {
          return [
            SliverAppBar(
              automaticallyImplyLeading: false,
              leading: Padding(
          padding: const EdgeInsets.all(10.0),
          child: InkWell(
            onTap: () => Navigator.of(context).pushNamed(AppRoutes.profile),
            splashColor: AppColors.primaryColor,
            child: CircleAvatar(
              radius: 25,
              backgroundColor: AppColors.whiteColor,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: SvgPicture.asset(
                  userSvg,
                  fit: BoxFit.cover,
                  color: AppColors.primaryColor,
                ),
              ),
            ),
          ),
        ),
              title: Text(
                appointmentString,
                style: heavySize20Text(AppColors.whiteColor),
              ),
              floating: true,
              pinned: true,
              backgroundColor: AppColors.primaryColor,
              bottom: const TabBar(
                indicatorColor: AppColors.whiteColor,
                indicatorWeight: 3,
                tabs: [
                  Tab(
                    text: upcomingString,
                  ),
                  Tab(
                    text: pastString,
                  ),
                  Tab(
                    text: cancelString,
                  ),
                ],
              ),
            ),
          ];
        },
        body: const TabBarView(
          children: [
            UpcomingAppointmentsPage(),
            PastAppointmentsPage(),
            CancelAppointmentsPage(),
          ],
        ),
      ),
    );
  }
}
