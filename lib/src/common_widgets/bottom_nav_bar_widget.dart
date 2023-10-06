import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:luvit/src/core/constants/app_colors.dart';
import 'package:luvit/src/core/extensions/string_log.dart';
import 'package:luvit/src/common_widgets/custom_image_view.dart';
import '../core/constants/image_assets.dart';

class BottomNavBarWidget extends StatefulWidget {
  const BottomNavBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<BottomNavBarWidget> createState() => _BottomNavBarWidgetState();
}

class _BottomNavBarWidgetState extends State<BottomNavBarWidget> {
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return ConvexAppBar(
      color: AppColors.greyBorderIconcolor,
      backgroundColor: AppColors.primaryBlackColor,
      shadowColor: AppColors.greyBorderIconcolor,
      style: TabStyle.fixedCircle,
      activeColor: AppColors.primarPinkColor,
      initialActiveIndex: activeIndex,
      items: [
        TabItem(
          icon: CustomImageView(
            margin: const EdgeInsets.only(bottom: 3, top: 2),
            svgPath: ImageAssets.homeIcon,
            alignment: Alignment.center,
            color: activeIndex == 0
                ? AppColors.primarPinkColor
                : AppColors.greyBorderIconcolor,
          ),
          title: '홈',
        ),
        TabItem(
          icon: CustomImageView(
            margin: const EdgeInsets.only(bottom: 3, top: 2),
            svgPath: ImageAssets.locationBottom,
            alignment: Alignment.center,
            color: activeIndex == 1
                ? AppColors.primarPinkColor
                : AppColors.greyBorderIconcolor,
          ),
          title: '스팟',
        ),
        TabItem(
          icon: Image.asset(
            ImageAssets.centerBottomNavIco,
            fit: BoxFit.contain,
          ),
        ),
        TabItem(
          icon: CustomImageView(
            margin: const EdgeInsets.only(bottom: 3, top: 2),
            svgPath: ImageAssets.bottomChatIcon,
            alignment: Alignment.center,
            color: activeIndex == 3
                ? AppColors.primarPinkColor
                : AppColors.greyBorderIconcolor,
          ),
          title: '채팅',
        ),
        TabItem(
          icon: CustomImageView(
            margin: const EdgeInsets.only(bottom: 3, top: 2),
            svgPath: ImageAssets.bottomPersonIcon,
            alignment: Alignment.center,
            color: activeIndex == 4
                ? AppColors.primarPinkColor
                : AppColors.greyBorderIconcolor,
          ),
          title: '마이',
        ),
      ],
      onTap: (int i) {
        ('click index=$i').log();
        setState(() {
          activeIndex = i;
        });
      },
    );
  }
}
