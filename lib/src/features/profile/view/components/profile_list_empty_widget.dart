import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:luvit/src/core/constants/app_colors.dart';
import 'package:luvit/src/core/utils/custom_text_styles.dart';
import 'package:luvit/src/features/profile/bloc/profile_bloc.dart';

class ProfileListEmptyWidget extends StatefulWidget {
  const ProfileListEmptyWidget({super.key});

  @override
  State<ProfileListEmptyWidget> createState() => _ProfileListEmptyWidgetState();
}

class _ProfileListEmptyWidgetState extends State<ProfileListEmptyWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        BlocProvider.of<ProfilesBloc>(context).add(const ProfilesGetEvent());
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '추천 드릴 친구들을 준비 중이에요',
                textAlign: TextAlign.center,
                style: CustomTextStyles.headline4BoldStyle,
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '매일 새로운 친구들을 소개시켜드려요',
                textAlign: TextAlign.center,
                style: CustomTextStyles.regularTextStyle
                    .copyWith(color: AppColors.greyText),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
