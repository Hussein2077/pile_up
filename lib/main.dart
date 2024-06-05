import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:pile_up/core/resource_manager/colors.dart';
import 'package:pile_up/core/resource_manager/routes.dart';
import 'package:pile_up/core/service/service_locator.dart';
import 'package:pile_up/core/translations/translations.dart';
import 'package:pile_up/features/auth/presentation/controller/login_bloc/login_with_email_and_password_bloc.dart';
import 'package:pile_up/features/auth/presentation/controller/sign_up_bloc/sign_up_with_email_and_password_bloc.dart';
import 'package:pile_up/features/blogs/presentation/controller/get_blogs/get_blogs_bloc.dart';
import 'package:pile_up/features/calendar/presentation/controller/calendar/calendar_bloc.dart';
import 'package:pile_up/features/create_pile/presentation/controller/create_pile/create_pile_carousel_bloc.dart';
import 'package:pile_up/features/create_pile/presentation/controller/user_folders/user_folders_bloc.dart';
import 'package:pile_up/features/home/presentation/controller/get_home_carousel/get_home_carousel_bloc.dart';
import 'package:pile_up/features/home/presentation/controller/get_notifications/get_notifications_bloc.dart';
import 'package:pile_up/features/merchants/presentation/controller/merchants_bloc.dart';
import 'package:pile_up/features/my_piles/presentation/controller/folders_by_search_controller/folders_by_search_bloc.dart';
import 'package:pile_up/features/my_piles/presentation/controller/folders_controller/folders_bloc.dart';
import 'package:pile_up/features/my_piles/presentation/controller/piles_im_in_controller/piles_im_in_bloc.dart';
import 'package:pile_up/features/my_piles/presentation/controller/piles_im_in_search_controller/piles_im_in_bloc.dart';
import 'package:pile_up/features/my_wallet/presentation/controller/controller/my_wallet_bloc.dart';
import 'package:pile_up/features/profile/presentation/controller/my_profile_bloc.dart';
import 'package:pile_up/features/vendors/presentation/controller/vendors_bloc.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await ServerLocator().init();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
      fallbackLocale: const Locale('en'),
      supportedLocales: const [
        Locale('en'),
        Locale('ar'),
      ],
      assetLoader: CodegenLoader(),
      path: 'lib/core/translations/',
      saveLocale: true,
      child: const MyApp()));

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<LoginWithEmailAndPasswordBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<SignUpWithEmailAndPasswordBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<GetBlogsBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<GetMerchantsBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<GetVendorsBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<GetHomeCarouselBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<CreatePileBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<GetUserFoldersBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<GetMyProfileBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<GetMyWalletBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<GetFoldersBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<GetFoldersBySearchBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<GetPilesImInBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<GetPilesImInBySearchBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<GetNotificationsBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<GetCalendarBloc>(),
        ),
      ],
      child: MaterialApp(
        locale: context.locale,
        supportedLocales: context.supportedLocales,
        localizationsDelegates: context.localizationDelegates,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RouteGenerator.getRoute,
        initialRoute: Routes.onBoarding,
        builder: EasyLoading.init(),
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor:AppColors.green,primaryContainer: Colors.white),
            cardColor: Colors.white,
            useMaterial3: true,
            // primaryColor: Colors.white,
            scaffoldBackgroundColor:AppColors.scaffoldBackground),
      ),
    );
  }
}
