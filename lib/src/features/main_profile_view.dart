import 'package:flutter/material.dart';
import 'package:luvit/src/core/constants/app_colors.dart';
import 'package:luvit/src/features/components/appbar_title_with_location_icon.dart';
import 'package:luvit/src/features/components/main_profile.dart';
import 'package:luvit/src/features/components/notification_icon_widget.dart';
import 'package:luvit/src/features/components/stars_count_widget.dart';
import 'package:luvit/src/common_widgets/bottom_nav_bar_widget.dart';

class MainPeofileView extends StatelessWidget {
  const MainPeofileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBlackColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryBlackColor,
        elevation: 0,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppBarTitleWithLocationIcon(),
            StarsCountWidget(),
          ],
        ),
        actions: const [
          NotificationIconWidget(),
        ],
      ),
      body: const MainProfile(),
      bottomNavigationBar: const BottomNavBarWidget(),
    );
  }
}
