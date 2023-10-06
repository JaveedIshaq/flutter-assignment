import 'package:luvit/src/common_widgets/custom_image_view.dart';
import 'package:luvit/src/core/constants/app_colors.dart';
import 'package:luvit/src/core/utils/custom_text_styles.dart';

import '../core/model/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    Key? key,
    required this.profile,
    required this.sliderHeight,
  }) : super(key: key);
  final Profile profile;
  final double sliderHeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: sliderHeight,
      //padding: const EdgeInsets.only(left: 10, right: 10),
      child: Stack(
        children: [
          ProfileImage(profile: profile, sliderHeight: sliderHeight),
          const GradientEffectOverlay(),
          Positioned(
            left: 0,
            right: 0,
            bottom: 20,
            child: Container(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const ProfileStarCountBadge(),
                      ProfileTitleText(profile: profile),
                      if (profile.tags!.isNotEmpty) ...[
                        Container(
                          margin: const EdgeInsets.only(top: 5),
                          decoration: BoxDecoration(
                            color: Colors.pink.withOpacity(0.1),
                            border: Border.all(color: Colors.pinkAccent),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              profile.tags![0],
                              style: const TextStyle(
                                  fontSize: 16, color: Colors.pink),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.black,
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text(
                                  profile.tags![1],
                                  style: const TextStyle(
                                      fontSize: 16, color: Colors.white),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.black,
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text(
                                  profile.tags![2],
                                  style: const TextStyle(
                                      fontSize: 16, color: Colors.white),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.black,
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text(
                                  profile.tags![5],
                                  style: const TextStyle(
                                      fontSize: 16, color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.black,
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              profile.tags![3],
                              style: const TextStyle(
                                  fontSize: 16, color: Colors.white),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.black,
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text(
                                  profile.tags![4],
                                  style: const TextStyle(
                                      fontSize: 16, color: Colors.white),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.black,
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text(
                                  profile.tags![5],
                                  style: const TextStyle(
                                      fontSize: 16, color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ] else
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: Text(
                            profile.littleTitle!,
                            style: CustomTextStyles.regularTextStyle.copyWith(
                              color: AppColors.greyText,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                      const SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                  SvgPicture.asset('assets/images/love.svg'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileTitleText extends StatelessWidget {
  const ProfileTitleText({
    super.key,
    required this.profile,
  });

  final Profile profile;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          profile.bigTitle!,
          style: CustomTextStyles.headline4BoldStyle,
        ),
        Text(
          ' 25',
          style: CustomTextStyles.headline4BoldStyle
              .copyWith(fontWeight: FontWeight.w300),
        ),
      ],
    );
  }
}

class ProfileStarCountBadge extends StatelessWidget {
  const ProfileStarCountBadge({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 7),
      decoration: BoxDecoration(
        color: Colors.black,
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
        child: Row(
          children: [
            SvgPicture.asset(
              'assets/images/dull_star.svg',
              width: 20,
            ),
            const SizedBox(width: 5),
            Text(
              ' 29,930',
              style: CustomTextStyles.regularTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}

class GradientEffectOverlay extends StatelessWidget {
  const GradientEffectOverlay({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 100),
      alignment: Alignment.bottomCenter,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: const [0, 0.6, 1],
          colors: [
            AppColors.primaryBlackColor.withAlpha(70),
            AppColors.primaryBlackColor.withAlpha(170),
            AppColors.primaryBlackColor.withAlpha(255),
          ],
        ),
      ),
    );
  }
}

class ProfileImage extends StatelessWidget {
  const ProfileImage({
    super.key,
    required this.profile,
    required this.sliderHeight,
  });

  final Profile profile;
  final double sliderHeight;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        shadowColor: AppColors.greyText,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: CustomImageView(
            imagePath: profile.imageAsset,
            height: sliderHeight,
          ),
        ),
      ),
    );
  }
}
