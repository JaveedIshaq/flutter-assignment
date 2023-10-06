import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:luvit/src/core/constants/image_assets.dart';
import 'package:luvit/src/core/constants/text_constants.dart';
import 'package:luvit/src/core/utils/custom_text_styles.dart';

class AppBarTitleWithLocationIcon extends StatelessWidget {
  const AppBarTitleWithLocationIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(ImageAssets.locationMark, height: 35),
        const SizedBox(width: 3),
        Text(
          StringValues.appBarTitleText,
          style: CustomTextStyles.boldTextStyle,
        ),
      ],
    );
  }
}
