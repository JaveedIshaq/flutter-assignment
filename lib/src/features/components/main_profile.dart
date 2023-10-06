import 'package:flutter/material.dart';
import 'package:luvit/src/core/constants/app_colors.dart';
import 'package:luvit/src/core/extensions/string_log.dart';
import 'package:luvit/src/core/helpers/flutter_card_swiper/flutter_card_swiper.dart';
import 'package:luvit/src/common_widgets/cards_slider_widget.dart';
import 'package:luvit/src/core/utils/custom_text_styles.dart';

class MainProfile extends StatefulWidget {
  const MainProfile({Key? key}) : super(key: key);

  @override
  State<MainProfile> createState() => _MainProfileState();
}

class _MainProfileState extends State<MainProfile> {
  List<Widget> draggableItems = [const CardsSliderWidget()];
  final CardSwiperController controller = CardSwiperController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (draggableItems.isEmpty) {
      return InkWell(
        onTap: () {
          draggableItems.add(const CardsSliderWidget());
          setState(() {});
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

    return Padding(
      padding: const EdgeInsets.only(top: 0),
      child: CardSwiper(
        allowedSwipeDirection:
            AllowedSwipeDirection.only(left: true, down: true),
        controller: controller,
        cardsCount: 1,
        onSwipe: _onSwipe,
        onUndo: _onUndo,
        numberOfCardsDisplayed: 1,
        backCardOffset: const Offset(40, 40),
        padding: const EdgeInsets.all(24.0),
        cardBuilder: (
          context,
          index,
          horizontalThresholdPercentage,
          verticalThresholdPercentage,
        ) =>
            const CardsSliderWidget(),
      ),
    );
  }

  bool _onSwipe(
    int previousIndex,
    int? currentIndex,
    CardSwiperDirection direction,
  ) {
    'The card $previousIndex was swiped to the ${direction.name}. Now the card $currentIndex is on top'
        .log();

    if (direction == CardSwiperDirection.left ||
        direction == CardSwiperDirection.bottom) {
      // emtoy the list
      setState(() {
        draggableItems = [];
      });

      return true;
    }

    return true;
  }

  bool _onUndo(
    int? previousIndex,
    int currentIndex,
    CardSwiperDirection direction,
  ) {
    'The card $currentIndex was undod from the ${direction.name}'.log();

    return true;
  }
}
