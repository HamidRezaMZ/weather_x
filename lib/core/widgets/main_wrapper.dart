import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:weather_x/features/feature_bookmark/presentation/pages/bookmark_screen.dart';
import 'package:weather_x/features/feature_weather/presentation/bloc/home_bloc.dart';

import 'package:weather_x/features/feature_weather/presentation/pages/home_screen.dart';



class MainWrapper extends StatefulWidget {
  const MainWrapper({super.key});

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  final PageController pageController = PageController(initialPage: 0);


  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [const HomeScreen(), const BookMarkScreen()];
    return const Scaffold(
      body: HomeScreen(),
    );
  }
}
