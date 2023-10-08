import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
      color: AppColors.greyBorderIconColor,
      backgroundColor: AppColors.primaryBlackColor,
      shadowColor: AppColors.greyBorderIconColor,
      style: TabStyle.fixedCircle,
      activeColor:
          (activeIndex == 2) ? Colors.black : AppColors.primaryPinkColor,
      initialActiveIndex: activeIndex,
      items: [
        TabItem(
          icon: CustomImageView(
            margin: const EdgeInsets.only(bottom: 3, top: 2),
            svgPath: ImageAssets.homeIcon,
            alignment: Alignment.center,
            color: activeIndex == 0
                ? AppColors.primaryPinkColor
                : AppColors.greyBorderIconColor,
          ),
          title: '홈',
        ),
        TabItem(
          icon: CustomImageView(
            margin: const EdgeInsets.only(bottom: 3, top: 2),
            svgPath: ImageAssets.locationBottom,
            alignment: Alignment.center,
            color: activeIndex == 1
                ? AppColors.primaryPinkColor
                : AppColors.greyBorderIconColor,
          ),
          title: '스팟',
        ),
        TabItem(
          icon: Stack(
            children: [
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment(0.44, -0.90),
                    end: Alignment(-0.44, 0.9),
                    colors: [Color(0xFF0F0F0F), Color(0xFF2E2E2E)],
                  ),
                  shape: BoxShape.circle,
                  border: Border.all(
                    width: 1,
                    color: (activeIndex == 2)
                        ? AppColors.primaryColor
                        : Colors.black,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: (activeIndex == 2)
                          ? AppColors.primaryColor.withOpacity(0.2)
                          : AppColors.shadowColor,
                      blurRadius: 4,
                      spreadRadius: 0,
                    ),
                  ],
                ),
              ),
              Center(
                  child: SvgPicture.asset(
                ImageAssets.starTop,
                height: 20,
                colorFilter: ColorFilter.mode(
                    (activeIndex == 2)
                        ? AppColors.primaryColor
                        : AppColors.primaryBlackColor,
                    BlendMode.srcIn),
              )),
            ],
          ),

          // Image.asset(
          //   ImageAssets.centerBottomNavIco,
          //   fit: BoxFit.contain,
          // ),
        ),
        TabItem(
          icon: CustomImageView(
            margin: const EdgeInsets.only(bottom: 3, top: 2),
            svgPath: ImageAssets.bottomChatIcon,
            alignment: Alignment.center,
            color: activeIndex == 3
                ? AppColors.primaryPinkColor
                : AppColors.greyBorderIconColor,
          ),
          title: '채팅',
        ),
        TabItem(
          icon: CustomImageView(
            margin: const EdgeInsets.only(bottom: 3, top: 2),
            svgPath: ImageAssets.bottomPersonIcon,
            alignment: Alignment.center,
            color: activeIndex == 4
                ? AppColors.primaryPinkColor
                : AppColors.greyBorderIconColor,
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
