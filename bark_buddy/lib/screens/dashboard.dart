import 'package:bark_buddy/screens/homepage.dart';
import 'package:bark_buddy/screens/profile.dart';
import 'package:bark_buddy/screens/wishlist.dart';
import 'package:flutter/material.dart';

import '../components/customBottomNavbar.dart';
import '../gen/assets.gen.dart';
import 'notifications.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {


  final PageController  _pageController = PageController();

  int _activePage = 0;
  List screens = [const Homepage(),const Wishlist(), const Notifications(), const Profile()];
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body:  Padding(
        padding: const EdgeInsets.only(top: 10),
        child:PageView.builder(
            physics: const NeverScrollableScrollPhysics(),
            controller: _pageController,
            itemCount: screens.length,
            onPageChanged: (int page) {
              setState(() {
                _activePage = page;
              });
            },
            itemBuilder: (BuildContext context, int index){
              return screens[_activePage];
            }
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(initialIndex: 0,
      navItems: [
       NavItem(selectedIcon: Assets.images.navbar.home.path, deselectedIcon: Assets.images.navbar.homeDe.path, label: "Home"),
        NavItem(selectedIcon: Assets.images.navbar.heart.path, deselectedIcon: Assets.images.navbar.heartDe.path, label: "Wishlist"),
        NavItem(selectedIcon: Assets.images.navbar.bellDe.path, deselectedIcon: Assets.images.navbar.bell.path, label: "Notifications"),
        NavItem(selectedIcon: Assets.images.navbar.user.path, deselectedIcon: Assets.images.navbar.userDe.path, label: "Account")
      ],
      onItemSelected: (value){
        _pageController.jumpToPage(value);
      },),
    );
  }
}
