import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:luvit/src/core/constants/image_assets.dart';
import 'package:luvit/src/core/constants/text_constants.dart';
import 'package:luvit/src/core/utils/custom_text_styles.dart';

class StarsCountWidget extends StatelessWidget {
  const StarsCountWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xff212121)),
        borderRadius: BorderRadius.circular(50.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            SvgPicture.asset(ImageAssets.starTop),
            const SizedBox(width: 3),
            Text(
              StringValues.starsValue,
              style: CustomTextStyles.regularTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}
