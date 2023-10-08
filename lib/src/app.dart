import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:luvit/src/core/constants/app_colors.dart';
import 'package:luvit/src/features/profile/bloc/profile_bloc.dart';
import 'package:luvit/src/features/profile/data/profile_repository.dart';
import 'package:luvit/src/features/profile/view/main_profile_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        //ProfileRepository
        RepositoryProvider<ProfileRepository>(
          create: ((context) => ProfileRepository()),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          //ProfileBloc
          BlocProvider<ProfilesBloc>(
            create: (context) => ProfilesBloc(
              repository: context.read<ProfileRepository>(),
            ),
          ),
        ],
        child: MaterialApp(
          title: 'Luvit Assignment Javeed Ishaq',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: 'Pretendard',
            colorScheme: ColorScheme.fromSeed(
              seedColor: AppColors.primaryPinkColor,
              background: AppColors.primaryBlackColor,
            ),
          ),
          home: const MainProfileView(),
        ),
      ),
    );
  }
}
