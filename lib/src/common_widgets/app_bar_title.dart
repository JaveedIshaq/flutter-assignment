import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:luvit/src/core/constants/app_colors.dart';
import 'package:luvit/src/core/constants/image_assets.dart';
import 'package:luvit/src/core/utils/custom_text_styles.dart';
import 'package:luvit/src/common_widgets/notification_icon_widget.dart';

class AppBarTitle extends StatelessWidget {
  final Widget title;
  final int starCount;
  final bool hasNotification;

  const AppBarTitle({
    super.key,
    required this.title,
    required this.starCount,
    this.hasNotification = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      decoration: const BoxDecoration(color: AppColors.black13),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(ImageAssets.locationMark, height: 30),
              const SizedBox(width: 6),
              title,
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 10,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(
                    width: 0.50,
                    color: const Color(0xff212121),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(ImageAssets.starTop),
                    const SizedBox(width: 2),
                    Text(
                      NumberFormat('###,###,###,###').format(starCount),
                      style: CustomTextStyles.regularTextStyle,
                    ),
                  ],
                ),
              ),
              const NotificationIconWidget()
            ],
          ),
        ],
      ),
    );
  }
}
