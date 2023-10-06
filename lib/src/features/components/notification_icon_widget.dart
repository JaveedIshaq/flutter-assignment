import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:luvit/src/core/constants/app_colors.dart';
import 'package:luvit/src/core/constants/image_assets.dart';

class NotificationIconWidget extends StatelessWidget {
  const NotificationIconWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: SvgPicture.asset(
        ImageAssets.notificationIconPath,
        colorFilter: ColorFilter.mode(AppColors.textWhite, BlendMode.srcIn),
      ),
    );
  }
}
