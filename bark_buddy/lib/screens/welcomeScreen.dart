import 'package:bark_buddy/utils/appConstants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../gen/assets.gen.dart';
import '../utils/appTextStyles.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  List screens = [
    Assets.images.image1.path,
    Assets.images.image2.path,
    Assets.images.image3.path
  ];
  int selectedImage = 0;
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(children: [
        SizedBox(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [],
          ),
        ),
        Positioned(
            bottom: MediaQuery.of(context).size.height * 0.4 - 30,
            left: 0,
            right: 0,
            child: Container(
                height: MediaQuery.of(context).size.height * 0.5,
                child: AnimatedBuilder(
                    animation: _pageController,
                    builder: (context, child) {
                      return PageView.builder(
                          controller: _pageController,
                          pageSnapping: true,
                          physics: const ScrollPhysics(),
                          itemCount: screens.length,
                          scrollDirection: Axis.horizontal,
                          onPageChanged: (value) {
                            setState(() {
                              selectedImage = value;
                            });
                          },
                          itemBuilder: (context, index) {
                            return _buildPage(context, index);
                          });
                    }))),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            height: MediaQuery.of(context).size.height * 0.4,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(color: Colors.grey, spreadRadius: 1.5, blurRadius: 5)
              ],
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20), topLeft: Radius.circular(15)),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    AppConstants.welcomeTitle,
                    style: AppTextStyles.poppinsBold(
                      fontSize: 22.0,
                      color: Colors.black,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    AppConstants.welcomeSubTitle,
                    textAlign: TextAlign.center,
                    style: AppTextStyles.poppinsMedium(
                      fontSize: 18.0,
                      color: Colors.black,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    height: 10,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: screens.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.only(right: 10),
                            height: 10,
                            width: 10,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                border: Border.all(color: Colors.black),
                                color: selectedImage == index
                                    ? Colors.black
                                    : Colors.white),
                          );
                        }),
                  ),
                  const Spacer(),
                  GestureDetector(onTap: (){
                    Navigator.pushNamed(context, '/second');
                  },
                    child: Container(
                      height: 45,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black,
                      ),
                      child: Center(
                        child: Text(
                          AppConstants.getStarted,
                          textAlign: TextAlign.center,
                          style: AppTextStyles.poppinsMedium(
                            fontSize: 16.0,
                            color: Colors.white,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }

  Widget _buildPage(BuildContext context, int index) {
    double scale = 1.0;
    if (_pageController.position.haveDimensions) {
      double page =
          _pageController.page ?? _pageController.initialPage.toDouble();
      scale = (1 - (page - index).abs() * 0.7).clamp(0.2, 1.0);
    }

    return Center(
      child: Transform.scale(
        scale: scale,
        child: Image.asset(
          screens[index],
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
