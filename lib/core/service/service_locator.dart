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
import 'package:pile_up/features/merchants/data/data_source/merchants_remote_data_source.dart';
import 'package:pile_up/features/merchants/data/repo_implementation/merchants_repo_imp.dart';
import 'package:pile_up/features/merchants/domain/repository/merchant_base_repo.dart';
import 'package:pile_up/features/merchants/domain/use_case/get_merchants_use_case.dart';
import 'package:pile_up/features/merchants/presentation/controller/merchants_bloc.dart';
import 'package:pile_up/features/vendors/data/data_source/vendors_remote_data_source.dart';
import 'package:pile_up/features/vendors/data/repo_implementation/vendors_repo_imp.dart';
import 'package:pile_up/features/vendors/domain/repository/vendor_base_repo.dart';
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


//use_case
    getIt.registerFactory(
        () => LoginWithEmailAndPasswordUseCase(baseRepository: getIt()));
    getIt.registerFactory(
        () => SignUpWithEmailAndPasswordUseCase(baseRepository: getIt()));

    getIt.registerFactory(() => GetBlogsUseCase(baseRepositoryBlogs: getIt()));
    getIt.registerFactory(() => GetMerchantsUseCase(baseRepositoryMerchants: getIt()));

    //remote data source
    getIt.registerLazySingleton<BaseRemotelyDataSourceBlogs>(
            () => BlogsRemotelyDateSource());
    getIt.registerLazySingleton<BaseRemotelyDataSourceMerchants>(
            () => MerchantsRemotelyDateSource());
    getIt.registerLazySingleton<BaseRemotelyDataSourceVendors>(
            () => VendorsRemotelyDateSource());

    // Repo Implementation
    getIt.registerLazySingleton<BaseRepositoryBlogs>(
            () => BlogsRepositoryImp(baseRemotelyDataSourceBlogs: getIt()));
    getIt.registerLazySingleton<BaseRepositoryMerchants>(
            () => MerchantsRepositoryImp(baseRemotelyDataSourceMerchants: getIt()));
    getIt.registerLazySingleton<BaseRepositoryVendors>(
            () => VendorsRepositoryImp(baseRemotelyDataSourceVendors: getIt()));
  }
}
