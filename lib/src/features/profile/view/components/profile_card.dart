import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:luvit/src/common_widgets/selected_image_indicator.dart';
import 'package:luvit/src/core/constants/app_colors.dart';
import 'package:luvit/src/core/constants/image_assets.dart';
import 'package:luvit/src/core/extensions/string_log.dart';
import 'package:luvit/src/core/utils/custom_text_styles.dart';
import 'package:luvit/src/features/profile/data/profile_model.dart';
import 'package:luvit/src/features/profile/view/components/tags.dart';

class ProfileCard extends StatefulWidget {
  final double width;
  final double height;
  final ProfileModel profile;

  const ProfileCard({
    Key? key,
    double? width,
    double? height,
    required this.profile,
  })  : width = width ?? 340,
        height = height ?? 600,
        super(key: key);

  @override
  State<ProfileCard> createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
  late ProfileModel cardDataToShowOnImage;
  int imageIndex = 0;

  @override
  void initState() {
    super.initState();
    setProfileModelToShow();
  }

  setProfileModelToShow() {
    setState(() {
      cardDataToShowOnImage = getProfileDataToShow(imageIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Center(
        child: Container(
          width: widget.width,
          height: widget.height,
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image.asset(
                  imageSource(imageIndex),
                  fit: BoxFit.fitWidth,
                  width: widget.width,
                  height: widget.height,
                ),
              ),
              //_buildProfileImage(),
              _buildBlackGradientOverlay(),
              _buildProfileInfoDataWidget(),
              Positioned(
                left: 0,
                top: 0,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      if (imageIndex > 0) {
                        imageIndex--;
                      }
                    });
                    setState(() {
                      cardDataToShowOnImage = getProfileDataToShow(imageIndex);
                    });
                  },
                  behavior: HitTestBehavior.opaque,
                  child: const SizedBox(
                    width: 160,
                    height: 100,
                  ),
                ),
              ),
              Positioned(
                right: 0,
                top: 0,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      if (imageIndex < widget.profile.images.length - 1) {
                        imageIndex++;
                      }
                    });
                    setState(() {
                      cardDataToShowOnImage = getProfileDataToShow(imageIndex);
                    });
                  },
                  behavior: HitTestBehavior.opaque,
                  child: const SizedBox(
                    width: 160,
                    height: 100,
                  ),
                ),
              ),
              Positioned(
                left: 0,
                bottom: 0,
                child: Container(
                  width: widget.width,
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: const Center(
                    child: Icon(
                      Icons.keyboard_arrow_down,
                      color: AppColors.white245,
                    ),
                  ),
                ),
              ),
              Positioned(
                right: 24,
                bottom: 60,
                child: SvgPicture.asset('assets/images/love.svg'),
              ),
              _buildImageNavigationIndicator(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRemoteProfileImage() {
    final String imageSource = widget.profile.images[imageIndex];
    ("imageSource: $imageSource").log();
    Widget imageWidget;

    if (imageSource.startsWith('data:')) {
      imageWidget = Image.memory(
        base64Decode(imageSource.split(',').last),
        fit: BoxFit.cover,
      );
    } else {
      imageWidget = CachedNetworkImage(
        imageUrl: imageSource,
        fit: BoxFit.fitWidth,
        placeholder: (context, url) =>
            const Center(child: CircularProgressIndicator()),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      );
    }

    return Positioned(
      left: 0,
      top: 0,
      child: Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: imageWidget,
        ),
      ),
    );
  }

  Widget _buildBlackGradientOverlay() {
    return Positioned(
      left: 0,
      top: 0,
      child: Container(
        width: widget.width,
        height: widget.height,
        decoration: ShapeDecoration(
          gradient: LinearGradient(
            begin: const Alignment(0.00, 1.00),
            end: const Alignment(0, -1),
            colors: [Colors.black, Colors.black.withOpacity(0)],
          ),
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 0.50, color: Color(0xFF3A3A3A)),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }

  Widget _buildProfileInfoDataWidget() {
    return Positioned(
      left: 24,
      bottom: 60,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildLikeCountWidget(),
          const SizedBox(height: 4),
          // Name and age
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                constraints: const BoxConstraints(maxWidth: 230),
                child: Text(
                  cardDataToShowOnImage.name,
                  style: CustomTextStyles.headline3BoldStyle,
                ),
              ),
              const SizedBox(width: 4),
              Text(
                '${cardDataToShowOnImage.age}',
                style: CustomTextStyles.headline4ThinStyle,
              ),
            ],
          ),
          const SizedBox(height: 4),
          // Profile description or tags
          SizedBox(
            width: 240,
            child: DefaultTextStyle(
              style: CustomTextStyles.thinTextStyle,
              child: (imageIndex == 0)
                  ? Text(cardDataToShowOnImage.location ?? '')
                  : (imageIndex == 1)
                      ? Text(cardDataToShowOnImage.description ?? '')
                      : ProfileTags(profile: cardDataToShowOnImage),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildLikeCountWidget() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: ShapeDecoration(
        color: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(ImageAssets.starDark),
          const SizedBox(width: 2),
          Text(
            NumberFormat('###,###,###,###')
                .format(cardDataToShowOnImage.likeCount),
            style: CustomTextStyles.regularTextStyle,
          ),
        ],
      ),
    );
  }

  Widget _buildImageNavigationIndicator() {
    return Positioned(
      left: 16,
      right: 16,
      top: 16,
      child: SelectedImageIndicator(
        selectedIndex: imageIndex,
        itemCount: widget.profile.images.length,
        onItemSelected: (index) {
          setState(() {
            imageIndex = index;
          });
          setState(() {
            cardDataToShowOnImage = getProfileDataToShow(imageIndex);
          });
        },
      ),
    );
  }

  String imageSource(int imageIndex) {
    switch (imageIndex) {
      case 0:
        // Return the default image source when imageIndex is 0
        return 'assets/images/101_Main_Profile_01.png';
      case 1:
        // Return the image source for index 1
        return 'assets/images/102_Main_Profile_02.png';
      case 2:
        // Return the image source for index 2
        return 'assets/images/103_Main_Profile_03.png';
      // Add more cases as needed
      default:
        // Return a default image source for other indices
        return 'assets/images/103_Main_Profile_03.png';
    }
  }

  // Select the Info Data to Show for each Image
  static ProfileModel getProfileDataToShow(int imageIndex) {
    switch (imageIndex) {
      case 0:
        return localProfilesList[0];
      case 1:
        return localProfilesList[1];
      case 2:
        return localProfilesList[2];
      // Add more cases as needed
      default:
        return localProfilesList[2];
    }
  }
}
