// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:ihealth/features/splashPage/progress_bar.dart';
import 'package:ihealth/features/splashPage/universal_splash.dart';

class SplashScreenWrapper extends StatefulWidget {
  const SplashScreenWrapper({Key? key}) : super(key: key);

  @override
  _SplashScreenWrapperState createState() => _SplashScreenWrapperState();
}

class _SplashScreenWrapperState extends State<SplashScreenWrapper> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int page) {
    setState(() {
      _currentPage = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    const int totalPages = 3;
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: _onPageChanged,
            children: [
              UniversalSplashScreen(
                backgroundImage: 'assets/img/image.png',
                text: 'Начни заботиться о своем здоровье сейчас',
                currentPage: _currentPage,
                totalPages: totalPages,
              ),
              UniversalSplashScreen(
                backgroundImage: 'assets/img/image2.png',
                text: 'Ваш путь к здоровью начинается здесь',
                currentPage: _currentPage,
                totalPages: totalPages,
              ),
              UniversalSplashScreen(
                backgroundImage: 'assets/img/image3.png',
                text: 'Здоровое сообщество начинается с вас',
                currentPage: _currentPage,
                totalPages: totalPages,
              ),
            ],
          ),
          Positioned(
            top: MediaQuery.of(context).padding.top,
            left: 0,
            right: 0,
            child: ProgressBar(
              currentPage: _currentPage,
              pageCount: totalPages,
              barWidth: MediaQuery.of(context).size.width / totalPages,
            ),
          ),
        ],
      ),
    );
  }
}
