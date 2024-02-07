import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pile_up/core/resource_manager/asset_path.dart';
import 'package:pile_up/core/resource_manager/colors.dart';
import 'package:pile_up/core/resource_manager/routes.dart';
import 'package:pile_up/core/resource_manager/string_manager.dart';
import 'package:pile_up/core/utils/app_size.dart';

import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:pile_up/features/home/presentation/home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);
  static int mainIndex = 0;

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late PersistentTabController _controller;

  List<Widget> _buildScreens() {
    return [
      HomeScreen(),
      SizedBox(),
      SizedBox(),
      SizedBox(),
      SizedBox(),
      //   HomeScreen(
      //     onPressedJob: (){
      //     MainScreen.mainIndex=2;
      // Navigator.pushNamed(context, Routes.main);
      //   },
      //   onPressedIntern: (){
      //     MainScreen.mainIndex=1;
      //     Navigator.pushNamed(context, Routes.main);
      //   },
      //   ),
      //  InternshipScreen(),
      //  JobsScreen(),
      //  HomeScreen(),
      //  HomeScreen(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Image.asset(
          AssetPath.home,
          width: AppSize.defaultSize! * 3,
          height: AppSize.defaultSize! * 3,
        ),
        inactiveIcon: Image.asset(
          AssetPath.homeI,
          width: AppSize.defaultSize! * 2.5,
          height: AppSize.defaultSize! * 2.5,
        ),
      ),
      PersistentBottomNavBarItem(
        icon: Image.asset(
          AssetPath.myPileI,
          width: AppSize.defaultSize! * 3,
          height: AppSize.defaultSize! * 3,
        ),
        inactiveIcon: Image.asset(
          AssetPath.myPile,
          width: AppSize.defaultSize! * 2.5,
          height: AppSize.defaultSize! * 2.5,
        ),
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.add, color: Colors.white, size: 40),
        activeColorPrimary: AppColors.green,
      ),
      PersistentBottomNavBarItem(
        icon: Image.asset(
          AssetPath.pilesI,
          width: AppSize.defaultSize! * 3,
          height: AppSize.defaultSize! * 3,
        ),
        inactiveIcon: Image.asset(
          AssetPath.piles,
          width: AppSize.defaultSize! * 2.5,
          height: AppSize.defaultSize! * 2.5,
        ),
      ),
      PersistentBottomNavBarItem(
        icon: Image.asset(
          AssetPath.calendarI,
          width: AppSize.defaultSize! * 3,
          height: AppSize.defaultSize! * 3,
        ),
        inactiveIcon: Image.asset(
          AssetPath.calendar,
          width: AppSize.defaultSize! * 2.5,
          height: AppSize.defaultSize! * 2.5,
        ),
      ),
    ];
  }

  @override
  void initState() {
    _controller = PersistentTabController(initialIndex: MainScreen.mainIndex);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: const HomeDrawer(),
      drawerScrimColor: AppColors.greyColor,
      body: PersistentTabView(
        context,
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        confineInSafeArea: true,

        backgroundColor: Colors.black,
        // Default is Colors.white.
        handleAndroidBackButtonPress: true,
        // Default is true.
        resizeToAvoidBottomInset: true,
        // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
        stateManagement: true,
        // Default is true.
        hideNavigationBarWhenKeyboardShows: true,
        // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(AppSize.defaultSize! * 2),
              topLeft: Radius.circular(AppSize.defaultSize! * 2)),
          colorBehindNavBar: Colors.white,
        ),
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: const ItemAnimationProperties(
          // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: const ScreenTransitionAnimation(
          // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle:
            NavBarStyle.style15, // Choose the nav bar style with this property.
      ),
    );
  }
}