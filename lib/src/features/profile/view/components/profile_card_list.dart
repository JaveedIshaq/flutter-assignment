import 'package:flutter/material.dart';
import 'package:luvit/src/core/extensions/string_log.dart';
import 'package:luvit/src/core/helpers/flutter_card_swiper/flutter_card_swiper.dart';
import 'package:luvit/src/features/profile/data/profile_model.dart';
import 'package:luvit/src/features/profile/view/components/profile_card.dart';
import 'package:luvit/src/features/profile/view/components/profile_list_empty_widget.dart';

class ProfileList extends StatefulWidget {
  const ProfileList({Key? key, required this.fetchedProfilesList})
      : super(key: key);

  final List<ProfileModel> fetchedProfilesList;

  @override
  State<ProfileList> createState() => _ProfileListState();
}

class _ProfileListState extends State<ProfileList> {
  final CardSwiperController controller = CardSwiperController();
  List<ProfileModel> allProfilesList = [];
  int selectedProfileIndex = 0;

  @override
  void initState() {
    super.initState();
    setProfilesList();
  }

  setProfilesList() {
    setState(() => allProfilesList = widget.fetchedProfilesList);
  }

  @override
  Widget build(BuildContext context) {
    return allProfilesList.isEmpty
        ? const ProfileListEmptyWidget()
        : Stack(
            alignment: Alignment.topCenter,
            children: [
              // Display the current profile card with swipe functionality.
              CardSwiper(
                allowedSwipeDirection:
                    AllowedSwipeDirection.only(left: true, down: true),
                controller: controller,
                cardsCount: allProfilesList.length,
                onSwipe: _onSwipe,
                onUndo: _onUndo,
                numberOfCardsDisplayed: 1,
                backCardOffset: const Offset(40, 40),
                padding: const EdgeInsets.only(bottom: 80),
                cardBuilder: (
                  context,
                  index,
                  horizontalThresholdPercentage,
                  verticalThresholdPercentage,
                ) =>
                    ProfileCard(
                  key: Key('$selectedProfileIndex'),
                  profile: allProfilesList[selectedProfileIndex],
                  width: MediaQuery.of(context).size.width - 70,
                  height: MediaQuery.of(context).size.height - 220,
                ),
              ),
              // Show a small part of the next card to indicate more cards are available.
              if (selectedProfileIndex + 1 < allProfilesList.length)
                Positioned(
                  left: MediaQuery.of(context).size.width - 20,
                  top: 0,
                  child: ProfileCard(
                    key: Key('$selectedProfileIndex'),
                    profile: allProfilesList[selectedProfileIndex + 1],
                    width: MediaQuery.of(context).size.width - 70,
                    height: MediaQuery.of(context).size.height - 220,
                  ),
                ),
            ],
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
      if (selectedProfileIndex + 1 == allProfilesList.length) {
        setState(() {
          allProfilesList = [];
        });
      } else {
        setState(() {
          selectedProfileIndex++;
        });
      }

      return true;
    }

    return true;
  }

  bool _onUndo(
    int? previousIndex,
    int currentIndex,
    CardSwiperDirection direction,
  ) {
    'The card $currentIndex was undo from the ${direction.name}'.log();

    return true;
  }
}
