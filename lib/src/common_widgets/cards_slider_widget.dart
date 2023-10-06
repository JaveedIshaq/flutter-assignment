import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:luvit/src/common_widgets/profile_card.dart';
import 'package:luvit/src/core/constants/app_colors.dart';
import 'package:luvit/src/core/extensions/string_log.dart';
import 'package:luvit/src/core/model/profile.dart';

class CardsSliderWidget extends StatefulWidget {
  const CardsSliderWidget({
    super.key,
  });

  @override
  State<CardsSliderWidget> createState() => _CardsSliderWidgetState();
}

class _CardsSliderWidgetState extends State<CardsSliderWidget> {
  List<Profile> appBannersList = profilesList;
  int _currentIndex = 0;
  final CarouselController _carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    final sliderHeight = MediaQuery.of(context).size.height - 200;
    return Stack(
      children: [
        CarouselSlider(
          carouselController: _carouselController,
          options: CarouselOptions(
              viewportFraction: 0.9,
              autoPlay: false,
              enableInfiniteScroll: false,
              enlargeCenterPage: false,
              height: sliderHeight,
              autoPlayInterval: const Duration(seconds: 3),
              onPageChanged: (int index, CarouselPageChangedReason reason) {
                'the current Carasoul Index: $index'.log();
                setState(() {
                  _currentIndex = index;
                });
              }),
          items: [
            for (var i = 1; i <= num.parse('${appBannersList.length}'); i++) i
          ].map((int item) {
            return ProfileCard(
              profile: appBannersList[item - 1],
              sliderHeight: sliderHeight,
            );
          }).toList(),
        ),
        if (_currentIndex + 1 < appBannersList.length)
          Positioned(
            top: 0,
            right: 40,
            child: InkWell(
              onTap: () {
                _carouselController.nextPage();
              },
              child: Container(
                height: 100,
                width: 80,
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                ),
              ),
            ),
          ),
        if (_currentIndex != 0)
          Positioned(
            top: 0,
            left: 40,
            child: InkWell(
              onTap: () {
                _carouselController.previousPage();
              },
              child: Container(
                height: 100,
                width: 80,
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                ),
              ),
            ),
          ),
        Positioned(
          top: 16,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: appBannersList.map((banner) {
              final index = appBannersList.indexOf(banner);
              return Container(
                width: 56,
                height: 5,
                margin: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: _currentIndex == index
                      ? AppColors.primarPinkColor
                      : AppColors.primaryBlackColor,
                ),
              );
            }).toList(),
          ),
        ),
        const Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Icon(
            Icons.keyboard_arrow_down,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
