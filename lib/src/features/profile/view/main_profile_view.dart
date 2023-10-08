import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:luvit/src/common_widgets/bottom_nav_bar_widget.dart';
import 'package:luvit/src/common_widgets/app_bar_title.dart';
import 'package:luvit/src/core/constants/app_colors.dart';
import 'package:luvit/src/core/utils/custom_text_styles.dart';
import 'package:luvit/src/features/profile/bloc/profile_bloc.dart';
import 'package:luvit/src/features/profile/view/components/profile_card_list.dart';

class MainProfileView extends StatefulWidget {
  const MainProfileView({super.key});

  @override
  State<MainProfileView> createState() => _MainProfileViewState();
}

class _MainProfileViewState extends State<MainProfileView> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ProfilesBloc>(context).add(const ProfilesGetEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBlackColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryBlackColor,
        elevation: 0,
        titleSpacing: 0.0,
        title: AppBarTitle(
          starCount: 323233,
          title: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: '목이길어슬픈기린',
                  style: CustomTextStyles.boldTextStyle,
                ),
                TextSpan(
                  text: '님의 새로운 ',
                  style: CustomTextStyles.thinTextStyle,
                ),
                TextSpan(
                  text: '스팟',
                  style: CustomTextStyles.boldTextStyle,
                ),
              ],
            ),
          ),
          hasNotification: true,
        ),
      ),
      body: Container(
        constraints: const BoxConstraints(minHeight: 700),
        child: BlocBuilder<ProfilesBloc, ProfilesState>(
          builder: (context, state) {
            if (state is ProfilesLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is ProfilesLoaded) {
              return Container(
                constraints: const BoxConstraints(minHeight: 700),
                child: ProfileList(
                  fetchedProfilesList: state.profilesList,
                ),
              );
            }

            if (state is ProfilesError) {
              return Center(child: Text(state.errorMessage));
            }

            return const SizedBox.shrink();
          },
        ),
      ),
      extendBody: true,
      bottomNavigationBar: const BottomNavBarWidget(),
    );
  }
}
