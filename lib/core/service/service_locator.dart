import 'package:get_it/get_it.dart';
import 'package:pile_up/features/auth/data/auth_remote_data_source.dart';
import 'package:pile_up/features/auth/data/repo_imp.dart';
import 'package:pile_up/features/auth/domain/repo/base_repo.dart';
import 'package:pile_up/features/auth/domain/use_case/login_with_email_and_password_use_case.dart';
import 'package:pile_up/features/auth/domain/use_case/sign_up_use_case.dart';
import 'package:pile_up/features/auth/presentation/controller/login_bloc/login_with_email_and_password_bloc.dart';
import 'package:pile_up/features/auth/presentation/controller/sign_up_bloc/sign_up_with_email_and_password_bloc.dart';
import 'package:pile_up/features/blogs/data/data_source/blogs_remote_data_source.dart';
import 'package:pile_up/features/blogs/data/repo_implementation/blogs_repo_imp.dart';
import 'package:pile_up/features/blogs/domain/repository/blog_base_repo.dart';
import 'package:pile_up/features/blogs/domain/use_case/get_blogs_use_case.dart';
import 'package:pile_up/features/blogs/presentation/controller/get_blogs/get_blogs_bloc.dart';
import 'package:pile_up/features/calendar/data/data_source/calendar_remote_data_source.dart';
import 'package:pile_up/features/calendar/data/repo_implementation/calendar_repo_imp.dart';
import 'package:pile_up/features/calendar/domain/repository/calender_base_repo.dart';
import 'package:pile_up/features/calendar/domain/use_case/calendar_use_case.dart';
import 'package:pile_up/features/calendar/presentation/controller/calendar/calendar_bloc.dart';
import 'package:pile_up/features/create_pile/data/data_source/create_pile_remote_data_source.dart';
import 'package:pile_up/features/create_pile/data/data_source/user_folder_remote_data_source.dart';
import 'package:pile_up/features/create_pile/data/repo_implementation/create_pile_repo_imp.dart';
import 'package:pile_up/features/create_pile/data/repo_implementation/user_folder_repo_imp.dart';
import 'package:pile_up/features/create_pile/domain/repository/create_pile_base_repo.dart';
import 'package:pile_up/features/create_pile/domain/repository/user_folders_base_repo.dart';
import 'package:pile_up/features/create_pile/domain/use_case/create_pile_use_case.dart';
import 'package:pile_up/features/create_pile/domain/use_case/user_folder_use_case.dart';
import 'package:pile_up/features/create_pile/presentation/controller/create_pile/create_pile_carousel_bloc.dart';
import 'package:pile_up/features/create_pile/presentation/controller/user_folders/user_folders_bloc.dart';
import 'package:pile_up/features/home/data/data_source/home_carousel_remote_data_source.dart';
import 'package:pile_up/features/home/data/data_source/notifications_remote_data_source.dart';
import 'package:pile_up/features/home/data/repo_implementation/home_carousel_repo_imp.dart';
import 'package:pile_up/features/home/data/repo_implementation/notification_repo_imp.dart';
import 'package:pile_up/features/home/domain/repository/home_carousel_base_repo.dart';
import 'package:pile_up/features/home/domain/repository/notification_base_repo.dart';
import 'package:pile_up/features/home/domain/use_case/get_home_carousel_use_case.dart';
import 'package:pile_up/features/home/domain/use_case/get_notifications_use_case.dart';
import 'package:pile_up/features/home/presentation/controller/get_home_carousel/get_home_carousel_bloc.dart';
import 'package:pile_up/features/home/presentation/controller/get_notifications/get_notifications_bloc.dart';
import 'package:pile_up/features/merchants/data/data_source/merchants_remote_data_source.dart';
import 'package:pile_up/features/merchants/data/repo_implementation/merchants_repo_imp.dart';
import 'package:pile_up/features/merchants/domain/repository/merchant_base_repo.dart';
import 'package:pile_up/features/merchants/domain/use_case/get_merchants_use_case.dart';
import 'package:pile_up/features/merchants/presentation/controller/merchants_bloc.dart';
import 'package:pile_up/features/my_piles/data/data_source/folders_remote_data_source.dart';
import 'package:pile_up/features/my_piles/data/data_source/piles_im_in_remote_data_source.dart';
import 'package:pile_up/features/my_piles/data/repo_implementation/folders_repo_imp.dart';
import 'package:pile_up/features/my_piles/data/repo_implementation/piles_im_in_repo_imp.dart';
import 'package:pile_up/features/my_piles/domain/repository/folder_base_repo.dart';
import 'package:pile_up/features/my_piles/domain/repository/piles_im_in_base_repo.dart';
import 'package:pile_up/features/my_piles/domain/use_case/get_folders_by_search_uc.dart';
import 'package:pile_up/features/my_piles/domain/use_case/get_folders_use_case.dart';
import 'package:pile_up/features/my_piles/domain/use_case/piles_im_in_by_search_uc.dart';
import 'package:pile_up/features/my_piles/domain/use_case/piles_im_in_use_case.dart';
import 'package:pile_up/features/my_piles/presentation/controller/folders_by_search_controller/folders_by_search_bloc.dart';
import 'package:pile_up/features/my_piles/presentation/controller/folders_controller/folders_bloc.dart';
import 'package:pile_up/features/my_piles/presentation/controller/piles_im_in_controller/piles_im_in_bloc.dart';
import 'package:pile_up/features/my_piles/presentation/controller/piles_im_in_search_controller/piles_im_in_bloc.dart';
import 'package:pile_up/features/my_wallet/data/data_source/my_wallet_remote_data_source.dart';
import 'package:pile_up/features/my_wallet/data/repo_implementation/blogs_repo_imp.dart';
import 'package:pile_up/features/my_wallet/domain/repository/MyWallet_base_repo.dart';
import 'package:pile_up/features/my_wallet/domain/use_case/get_blogs_use_case.dart';
import 'package:pile_up/features/my_wallet/presentation/controller/controller/my_wallet_bloc.dart';
import 'package:pile_up/features/profile/data/data_source/my_profile_remote_data_source.dart';
import 'package:pile_up/features/profile/data/repo_implementation/my_profile_repo_imp.dart';
import 'package:pile_up/features/profile/domain/repository/my_profile_base_repo.dart';
import 'package:pile_up/features/profile/domain/use_case/get_my_profile_use_case.dart';
import 'package:pile_up/features/profile/presentation/controller/my_profile_bloc.dart';
import 'package:pile_up/features/vendors/data/data_source/vendors_remote_data_source.dart';
import 'package:pile_up/features/vendors/data/repo_implementation/vendors_repo_imp.dart';
import 'package:pile_up/features/vendors/domain/repository/vendor_base_repo.dart';
import 'package:pile_up/features/vendors/domain/use_case/get_vendors_use_case.dart';
import 'package:pile_up/features/vendors/presentation/controller/vendors_bloc.dart';

final getIt = GetIt.instance;

class ServerLocator {
  Future<void> init() async {
    //bloc
    getIt.registerLazySingleton<BaseRemotelyDataSource>(
        () => AuthRemotelyDateSource());

    getIt.registerLazySingleton<BaseRepository>(
        () => RepositoryImp(baseRemotelyDataSource: getIt()));
    getIt.registerLazySingleton(() => LoginWithEmailAndPasswordBloc(
        loginWithEmailAndPasswordUseCase: getIt()));
    getIt.registerLazySingleton(() => SignUpWithEmailAndPasswordBloc(
        loginWithEmailAndPasswordUseCase: getIt()));

    getIt.registerLazySingleton(() => GetBlogsBloc(getBlogsUseCase: getIt()));
    getIt.registerLazySingleton(() => GetMerchantsBloc(getMerchantsUseCase: getIt()));
    getIt.registerLazySingleton(() => GetVendorsBloc(getVendorsUseCase: getIt()));
    getIt.registerLazySingleton(() => GetHomeCarouselBloc(getHomeCarouselUseCase: getIt()));
    getIt.registerLazySingleton(() => CreatePileBloc(createPileUseCase: getIt()));
    getIt.registerLazySingleton(() => GetUserFoldersBloc(getUserFoldersUseCase: getIt()));
    getIt.registerLazySingleton(() => GetMyProfileBloc(getMyProfileUseCase: getIt()));
    getIt.registerLazySingleton(() => GetMyWalletBloc(getMyWalletUseCase: getIt()));
    getIt.registerLazySingleton(() => GetFoldersBloc(getFoldersUseCase: getIt()));
    getIt.registerLazySingleton(() => GetFoldersBySearchBloc(getFoldersBySearchUseCase: getIt()));
    getIt.registerLazySingleton(() => GetPilesImInBloc(getPilesImInUseCase: getIt()));
    getIt.registerLazySingleton(() => GetPilesImInBySearchBloc(getPilesImInBySearchUseCase: getIt()));
    getIt.registerLazySingleton(() => GetNotificationsBloc(getNotificationsUseCase: getIt()));
    getIt.registerLazySingleton(() => GetCalendarBloc(getCalendarUseCase: getIt()));

//use_case
    getIt.registerFactory(
        () => LoginWithEmailAndPasswordUseCase(baseRepository: getIt()));
    getIt.registerFactory(
        () => SignUpWithEmailAndPasswordUseCase(baseRepository: getIt()));

    getIt.registerFactory(() => GetBlogsUseCase(baseRepositoryBlogs: getIt()));
    getIt.registerFactory(() => GetMerchantsUseCase(baseRepositoryMerchants: getIt()));
    getIt.registerFactory(() => GetVendorsUseCase(baseRepositoryVendors: getIt()));
    getIt.registerFactory(() => GetHomeCarouselUseCase(baseRepositoryHomeCarousel: getIt()));
    getIt.registerFactory(() => CreatePileUseCase(baseRepositoryCreatePile: getIt()));
    getIt.registerFactory(() => GetUserFoldersUseCase(baseRepositoryUserFolders: getIt()));
    getIt.registerFactory(() => GetMyProfileUseCase(baseRepositoryMyProfile: getIt()));
    getIt.registerFactory(() => GetMyWalletUseCase(baseRepositoryMyWallet: getIt()));
    getIt.registerFactory(() => GetFoldersUseCase(baseRepositoryFolders: getIt()));
    getIt.registerFactory(() => GetFoldersBySearchUseCase(baseRepositoryFolders: getIt()));
    getIt.registerFactory(() => GetPilesImInUseCase(baseRepositoryPilesImIn: getIt()));
    getIt.registerFactory(() => GetPilesImInBySearchUseCase(baseRepositoryPilesImIn: getIt()));
    getIt.registerFactory(() => GetNotificationsUseCase(baseRepositoryNotifications: getIt()));
    getIt.registerFactory(() => GetCalendarUseCase(baseRepositoryCalendar: getIt()));

    //remote data source
    getIt.registerLazySingleton<BaseRemotelyDataSourceBlogs>(
            () => BlogsRemotelyDateSource());
    getIt.registerLazySingleton<BaseRemotelyDataSourceMerchants>(
            () => MerchantsRemotelyDateSource());
    getIt.registerLazySingleton<BaseRemotelyDataSourceVendors>(
            () => VendorsRemotelyDateSource());
    getIt.registerLazySingleton<BaseRemotelyDataSourceHomeCarousel>(
            () => HomeCarouselRemotelyDateSource());
    getIt.registerLazySingleton<BaseRemotelyDataSourceCreatePile>(
            () => CreatePileRemotelyDateSource());
    getIt.registerLazySingleton<BaseRemotelyDataSourceUserFolders>(
            () => UserFoldersRemotelyDateSource());
    getIt.registerLazySingleton<BaseRemotelyDataSourceMyProfile>(
            () => MyProfileRemotelyDateSource());
    getIt.registerLazySingleton<BaseRemotelyDataSourceMyWallet>(
            () => MyWalletRemotelyDateSource());
    getIt.registerLazySingleton<BaseRemotelyDataSourceFolders>(
            () => FoldersRemotelyDateSource());
    getIt.registerLazySingleton<BaseRemotelyDataSourcePilesImIn>(
            () => PilesImInRemotelyDateSource());
    getIt.registerLazySingleton<BaseRemotelyDataSourceNotifications>(
            () => NotificationsRemotelyDateSource());
    getIt.registerLazySingleton<BaseRemotelyDataSourceCalendar>(
            () => CalendarRemotelyDateSource());

    // Repo Implementation
    getIt.registerLazySingleton<BaseRepositoryBlogs>(
            () => BlogsRepositoryImp(baseRemotelyDataSourceBlogs: getIt()));
    getIt.registerLazySingleton<BaseRepositoryMerchants>(
            () => MerchantsRepositoryImp(baseRemotelyDataSourceMerchants: getIt()));
    getIt.registerLazySingleton<BaseRepositoryVendors>(
            () => VendorsRepositoryImp(baseRemotelyDataSourceVendors: getIt()));
    getIt.registerLazySingleton<BaseRepositoryHomeCarousel>(
            () => HomeCarouselRepositoryImp(baseRemotelyDataSourceHomeCarousel: getIt()));
    getIt.registerLazySingleton<BaseRepositoryCreatePile>(
            () => CreatePileRepositoryImp(baseRemotelyDataSourceCreatePile: getIt()));
    getIt.registerLazySingleton<BaseRepositoryUserFolders>(
            () => UserFoldersRepositoryImp(baseRemotelyDataSourceUserFolders: getIt()));
    getIt.registerLazySingleton<BaseRepositoryMyProfile>(
            () => MyProfileRepositoryImp(baseRemotelyDataSourceMyProfile: getIt()));
    getIt.registerLazySingleton<BaseRepositoryMyWallet>(
            () => MyWalletRepositoryImp(baseRemotelyDataSourceMyWallet: getIt()));
    getIt.registerLazySingleton<BaseRepositoryFolders>(
            () => FoldersRepositoryImp(baseRemotelyDataSourceFolders: getIt()));
    getIt.registerLazySingleton<BaseRepositoryPilesImIn>(
            () => PilesImInRepositoryImp(baseRemotelyDataSourcePilesImIn: getIt()));
    getIt.registerLazySingleton<BaseRepositoryNotifications>(
            () => NotificationsRepositoryImp(baseRemotelyDataSourceNotifications: getIt()));
    getIt.registerLazySingleton<BaseRepositoryCalendar>(
            () => CalendarRepositoryImp(baseRemotelyDataSourceCalendar: getIt()));
  }
}
