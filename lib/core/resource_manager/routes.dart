import 'package:flutter/material.dart';
import 'package:pile_up/features/auth/presentation/forget%20password/change_password.dart';
import 'package:pile_up/features/auth/presentation/forget%20password/forget_password.dart';
import 'package:pile_up/features/auth/presentation/forget%20password/send_otp_code.dart';
import 'package:pile_up/features/auth/presentation/login_screen.dart';
import 'package:pile_up/features/auth/presentation/signup/sign_up.dart';
import 'package:pile_up/features/auth/terms_and_conditions/terms_conditions_screen.dart';
import 'package:pile_up/features/blogs/data/model/blog_model.dart';
import 'package:pile_up/features/blogs/presentation/blog_screen.dart';
import 'package:pile_up/features/home/presentation/home_screen.dart';
import 'package:pile_up/features/main_screen.dart';
import 'package:pile_up/features/my_piles/presentation/components/pile_options/via_email.dart';
import 'package:pile_up/features/my_piles/presentation/components/pile_options/via_sms.dart';
import 'package:pile_up/features/my_wallet/presentation/screens/my_wallet_Screen.dart';
import 'package:pile_up/features/on_boarding/on_boarding.dart';
import 'package:pile_up/features/profile/presentation/profile_screen.dart';
import 'package:pile_up/features/vendors/presentation/vendors_screen.dart';

import '../../features/home/presentation/components/Piles Details/piles_details.dart';

class Routes {
  static const String login = "/login";
  static const String main = "/main";
  static const String signUp = "/signUp";
  static const String forgetPassword = "/forgetPassword";
  static const String sendOTPCode = "/sendOTPCode";
  static const String changePassword = "/changePassword";
  static const String profile = "/profile";
  static const String myApplications = "/myApplications";
  static const String contactUs = "/contactUs";
  static const String onBoarding = "/OnBoarding";
  static const String pilesDetails = "/pilesDetails";
  static const String home = "/home";
  static const String blogScreen = "/BlogDetailsScreen";
  static const String viaEmail = "/viaEmail";
  static const String viaSMS = "/viaSMS";
  static const String qrCode = "/qrCode";
  static const String terms = "/terms";
  static const String myWallet = "/myWallet";
  static const String vendorsScreen = "/vendorsScreen";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.main:
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const MainScreen(),
            transitionsBuilder: customAnimate);
        case Routes.home:
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const HomeScreen(),
            transitionsBuilder: customAnimate);
      case Routes.login:
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const LoginScreen(),
            transitionsBuilder: customAnimate);
      case Routes.pilesDetails:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
          const PilesDetails(),
          transitionsBuilder: customAnimate,
        );
      case Routes.signUp:
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const SignUpScreen(),
            transitionsBuilder: customAnimate);
      case Routes.forgetPassword:
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const ForgetPassword(),
            transitionsBuilder: customAnimate);
      case Routes.sendOTPCode:
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const SendOTPCode(),
            transitionsBuilder: customAnimate);
      case Routes.changePassword:
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const ChangePassword(),
            transitionsBuilder: customAnimate);

        case Routes.onBoarding:
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const OnBoardingScreen(),
            transitionsBuilder: customAnimate);

        case Routes.blogScreen:
          BlogRoutesArguments blogRoutes=settings.arguments as BlogRoutesArguments;
          return PageRouteBuilder(
          settings: settings,
            pageBuilder: (context, animation, secondaryAnimation) =>
                  BlogScreen(blogArguments: blogRoutes),
            transitionsBuilder: customAnimate);
        case Routes.profile:
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const ProfileScreen(),
            transitionsBuilder: customAnimate);
        case Routes.viaEmail:
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const ViaEmail(),
            transitionsBuilder: customAnimate);
        case Routes.viaSMS:
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const ViaSMS(),
            transitionsBuilder: customAnimate);
      case Routes.terms:
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
            const TermsAndConditions(),
            transitionsBuilder: customAnimate);
      case Routes.myWallet:
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
            const MyWalletDetails(),
            transitionsBuilder: customAnimate);
      case Routes.vendorsScreen:
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
            const VendorsScreen(),
            transitionsBuilder: customAnimate);
    }
    return unDefinedRoute();
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}

Widget customAnimate(BuildContext context, Animation<double> animation,
    Animation<double> secondaryAnimation, Widget child) {
  // var begin = Offset(1.0, 0.0);
  // var end = Offset.zero;
  // var curve = Curves.decelerate;
  //
  // var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
  return FadeTransition(
    opacity: animation,
    child: child,
  );
}
class BlogRoutesArguments{
final   BlogModel blog;
 final List<BlogModel> blogs;

BlogRoutesArguments({required this.blogs, required this.blog});
}
