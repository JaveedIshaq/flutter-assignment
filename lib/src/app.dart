import 'package:flutter/material.dart';
import 'package:luvit/src/core/constants/app_colors.dart';
import 'package:luvit/src/features/main_profile_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Luvit Assignment Javeed Ishaq',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Pretendard',
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primarPinkColor,
          background: AppColors.primaryBlackColor,
        ),
      ),
      home: const MainPeofileView(),
    );
  }
}
