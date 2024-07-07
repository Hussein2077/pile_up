import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pile_up/core/resource_manager/asset_path.dart';
import 'package:pile_up/core/resource_manager/colors.dart';
import 'package:pile_up/core/utils/app_size.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:pile_up/features/calendar/presentation/calendar.dart';
import 'package:pile_up/features/create_pile/presentation/create_pile.dart';
import 'package:pile_up/features/home/presentation/components/drawer/drawer.dart';
import 'package:pile_up/features/home/presentation/home_screen.dart';
import 'package:pile_up/features/create_pile/presentation/componant/my_piles.dart';
import 'package:pile_up/features/create_pile/presentation/componant/piles_iam_in.dart';
import 'package:pile_up/features/profile/presentation/controller/my_profile_bloc.dart';

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
      const HomeScreen(),
      const MyPiles(),
      const CreatePileScreen(),
      const PileIAmIn(),
      const CalendarScreen(),
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
        icon: Icon(Icons.add,
            color: Colors.white,
            size: AppSize.defaultSize! * 2.4),
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
    BlocProvider.of<GetMyProfileBloc>(context).add(GetMyProfileEvent());

    _controller = PersistentTabController(initialIndex: MainScreen.mainIndex);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Builder(
          builder: (context) {
            return const HomeDrawer();
          }
      ),
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
          curve: Curves.slowMiddle,
        ),
        screenTransitionAnimation: const ScreenTransitionAnimation(
          // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          curve: Curves.bounceInOut,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle:
            NavBarStyle.style15, // Choose the nav bar style with this property.
      ),
    );
  }
}
