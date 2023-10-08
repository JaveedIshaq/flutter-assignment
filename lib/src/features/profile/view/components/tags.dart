import 'package:flutter/material.dart';
import 'package:luvit/src/core/constants/app_colors.dart';
import 'package:luvit/src/core/utils/custom_text_styles.dart';
import 'package:luvit/src/features/profile/data/profile_model.dart';

class ProfileTags extends StatelessWidget {
  final ProfileModel profile;

  const ProfileTags({
    required this.profile,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.start,
      spacing: 4,
      runSpacing: 4,
      children: profile.tags
          .asMap()
          .entries
          .map((entry) => _buildProfileTag(entry.value, index: entry.key))
          .toList(),
    );
  }

  Widget _buildProfileTag(
    String label, {
    required int index,
  }) {
    final bool highlight = index == 0;

    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 13,
        horizontal: 15,
      ),
      decoration: ShapeDecoration(
        color:
            highlight ? AppColors.primaryPartial : AppColors.primaryBlackColor,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 0.50,
            color: highlight ? AppColors.primaryColor : AppColors.black31,
          ),
          borderRadius: BorderRadius.circular(100),
        ),
      ),
      child: Text(
        label,
        style: CustomTextStyles.boldTextStyle.copyWith(
          color: highlight ? AppColors.primaryColor : AppColors.textWhite,
        ),
      ),
    );
  }
}
