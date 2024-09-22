import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:template/features/question/data/repositories/repo_impl.dart';
import 'package:template/features/travel/data/datasources/travel_remote_data_source.dart';
import 'package:template/features/travel/domain/repositories/repository.dart';
import 'package:template/features/travel/domain/usecases/travel_useCase.dart';

import '../features/auth/data/remote_source/auth_remote_data_source.dart';
import '../features/auth/data/repository/repository_impl.dart';
import '../features/auth/domain/repo/repository.dart';
import '../features/auth/domain/useCase/auth_useCase.dart';

import '../features/home/data/remote_data_source/home_remote_data_source.dart';
import '../features/home/data/repo_impl/repo_impl.dart';
import '../features/home/domain/repo/repository.dart';
import '../features/home/domain/useCase/home_useCase.dart';
import '../features/question/data/datasources/question_local_data_source.dart';
import '../features/question/data/datasources/question_remote_data_source.dart';
import '../features/question/domain/repositories/repository.dart';
import '../features/question/domain/usecases/question_useCase.dart';
import '../features/tips/data/datasources/tips_local_data_source.dart';
import '../features/tips/data/repositories/repo_impl.dart';
import '../features/tips/domain/repositories/repository.dart';
import '../features/tips/domain/usecases/tips_useCase.dart';
import '../features/travel/data/datasources/travel_local_data_source.dart';
import '../features/travel/data/repositories/repo_impl.dart';
import 'app_prefs.dart';
import 'media/media_service.dart';
import 'media/media_service_interface.dart';
import 'network/api_app.dart';
import 'network/dio_factory.dart';
import 'network/network_info.dart';
import 'network/token.dart';
import 'permission/permission_handler_permission_service.dart';
import 'permission/permission_service.dart';

final locator = GetIt.instance;
// serviceLocator
///this general decency injection
Future<void> initAppModule() async {
  //shared preference instance
  final sharedPref = await SharedPreferences.getInstance();

  locator.registerLazySingleton<SharedPreferences>(
      () => sharedPref); //this create when call

  //instance app preferences

  locator
      .registerLazySingleton<AppPreferences>(() => AppPreferences(locator()));

  // network info
  locator.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(InternetConnectionChecker()));

  // dio factory
  locator.registerLazySingleton<DioFactory>(() => DioFactory(locator()));

  //app service client

  Dio dio = await locator<DioFactory>().getDio();

  locator.registerLazySingleton<AppServiceClient>(() => AppServiceClient(dio));

  locator.registerLazySingleton(() => TokenService(dio: dio));

  locator.registerSingleton<PermissionService>(
      PermissionHandlerPermissionService());

  locator.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);

  locator.registerLazySingleton<FirebaseFirestore>(
      () => FirebaseFirestore.instance);

  locator
      .registerLazySingleton<FirebaseStorage>(() => FirebaseStorage.instance);

  locator.registerSingleton<MediaServiceInterface>(MediaService());
}

//NEW for initiating login module
//saves user and token in shared Preferences

///this login decency injection
initAuthModule() {
  // firebase

  if (!GetIt.I.isRegistered<AuthRemoteDataSource>()) {
    locator.registerLazySingleton<AuthRemoteDataSource>(() =>
        AuthRemoteDataSourceImpl(locator(), locator(), locator(), locator()));
  }
  if (!GetIt.I.isRegistered<Repository>()) {
    locator.registerLazySingleton<Repository>(
        () => AuthRepositoryImpl(locator(), locator()));
  }
  if (!GetIt.I.isRegistered<LoginUseCase>()) {
    locator.registerFactory<LoginUseCase>(() => LoginUseCase(locator()));
  }
  if (!GetIt.I.isRegistered<RegisterUseCase>()) {
    locator.registerFactory<RegisterUseCase>(() => RegisterUseCase(locator()));
  }

  if (!GetIt.I.isRegistered<LogoutUseCase>()) {
    locator.registerFactory<LogoutUseCase>(() => LogoutUseCase(locator()));
  }

  if (!GetIt.I.isRegistered<StoreUserUseCase>()) {
    locator
        .registerFactory<StoreUserUseCase>(() => StoreUserUseCase(locator()));
  }
  if (!GetIt.I.isRegistered<AuthGetUserUseCase>()) {
    locator.registerFactory<AuthGetUserUseCase>(
        () => AuthGetUserUseCase(locator()));
  }
  if (!GetIt.I.isRegistered<AuthUpdateUserUseCase>()) {
    locator.registerFactory<AuthUpdateUserUseCase>(
        () => AuthUpdateUserUseCase(locator()));
  }
}

///this KDS dependency injection
initHomeModule() {
  if (!GetIt.I.isRegistered<HomeRemoteDataSource>()) {
    locator.registerLazySingleton<HomeRemoteDataSource>(
        () => HomeRemoteDataSourceImpl(locator()));
  }
  if (!GetIt.I.isRegistered<HomeRepository>()) {
    locator.registerLazySingleton<HomeRepository>(
        () => HomeRepositoryImpl(locator(), locator()));
  }
  if (!GetIt.I.isRegistered<HomeGetAllMealsUseCase>()) {
    locator.registerFactory<HomeGetAllMealsUseCase>(
        () => HomeGetAllMealsUseCase(locator()));
  }
}

initTravelModule() {
  if (!GetIt.I.isRegistered<TravelRemoteDataSource>()) {
    locator.registerLazySingleton<TravelRemoteDataSource>(
        () => TravelRemoteDataSourceImpl(locator(), locator()));
  }

  if (!GetIt.I.isRegistered<TravelLocalDataSource>()) {
    locator.registerLazySingleton<TravelLocalDataSource>(
        () => TravelLocalDataSourceImpl());
  }
  if (!GetIt.I.isRegistered<TravelRepository>()) {
    locator.registerLazySingleton<TravelRepository>(
        () => TraveRepositoryImpl(locator(), locator(), locator()));
  }

  if (!GetIt.I.isRegistered<TravelGetAllUseCase>()) {
    locator.registerFactory<TravelGetAllUseCase>(
        () => TravelGetAllUseCase(locator()));
  }

  if (!GetIt.I.isRegistered<TravelAddOrUpdateUseCase>()) {
    locator.registerFactory<TravelAddOrUpdateUseCase>(
        () => TravelAddOrUpdateUseCase(locator()));
  }

  if (!GetIt.I.isRegistered<TravelDeleteUseCase>()) {
    locator.registerFactory<TravelDeleteUseCase>(
        () => TravelDeleteUseCase(locator()));
  }

  if (!GetIt.I.isRegistered<TravelListLocalAddOrUpdateUseCase>()) {
    locator.registerFactory<TravelListLocalAddOrUpdateUseCase>(
        () => TravelListLocalAddOrUpdateUseCase(locator()));
  }

  if (!GetIt.I.isRegistered<TravelListLocalDeleteUseCase>()) {
    locator.registerFactory<TravelListLocalDeleteUseCase>(
        () => TravelListLocalDeleteUseCase(locator()));
  }

  if (!GetIt.I.isRegistered<TravelListLocalDeleteAllUseCase>()) {
    locator.registerFactory<TravelListLocalDeleteAllUseCase>(
        () => TravelListLocalDeleteAllUseCase(locator()));
  }

  if (!GetIt.I.isRegistered<TravelListLocalDeleteAllUpdatedUseCase>()) {
    locator.registerFactory<TravelListLocalDeleteAllUpdatedUseCase>(
        () => TravelListLocalDeleteAllUpdatedUseCase(locator()));
  }
}

initQuestionModule() {
  if (!GetIt.I.isRegistered<QuestionRemoteDataSource>()) {
    locator.registerLazySingleton<QuestionRemoteDataSource>(
        () => QuestionRemoteDataSourceImpl(locator(), locator()));
  }

  if (!GetIt.I.isRegistered<QuestionLocalDataSource>()) {
    locator.registerLazySingleton<QuestionLocalDataSource>(
        () => QuestionLocalDataSourceImpl());
  }
  if (!GetIt.I.isRegistered<QuestionRepository>()) {
    locator.registerLazySingleton<QuestionRepository>(
        () => QuestionRepositoryImpl(locator(), locator(), locator()));
  }

  if (!GetIt.I.isRegistered<QuestionGetAllUseCase>()) {
    locator.registerFactory<QuestionGetAllUseCase>(
        () => QuestionGetAllUseCase(locator()));
  }

  if (!GetIt.I.isRegistered<QuestionAddOrUpdateUseCase>()) {
    locator.registerFactory<QuestionAddOrUpdateUseCase>(
        () => QuestionAddOrUpdateUseCase(locator()));
  }

  if (!GetIt.I.isRegistered<QuestionDeleteUseCase>()) {
    locator.registerFactory<QuestionDeleteUseCase>(
        () => QuestionDeleteUseCase(locator()));
  }

  if (!GetIt.I.isRegistered<QuestionListLocalAddOrUpdateUseCase>()) {
    locator.registerFactory<QuestionListLocalAddOrUpdateUseCase>(
        () => QuestionListLocalAddOrUpdateUseCase(locator()));
  }

  if (!GetIt.I.isRegistered<QuestionListLocalDeleteUseCase>()) {
    locator.registerFactory<QuestionListLocalDeleteUseCase>(
        () => QuestionListLocalDeleteUseCase(locator()));
  }

  if (!GetIt.I.isRegistered<QuestionListLocalDeleteAllUseCase>()) {
    locator.registerFactory<QuestionListLocalDeleteAllUseCase>(
        () => QuestionListLocalDeleteAllUseCase(locator()));
  }

  if (!GetIt.I.isRegistered<QuestionListLocalDeleteAllUpdatedUseCase>()) {
    locator.registerFactory<QuestionListLocalDeleteAllUpdatedUseCase>(
        () => QuestionListLocalDeleteAllUpdatedUseCase(locator()));
  }
  if (!GetIt.I.isRegistered<QuestionSearchUseCase>()) {
    locator.registerFactory<QuestionSearchUseCase>(
        () => QuestionSearchUseCase(locator()));
  }
}

initTipsModule() {
  if (!GetIt.I.isRegistered<TipLocalDataSource>()) {
    locator.registerLazySingleton<TipLocalDataSource>(
        () => TipLocalDataSourceImpl());
  }
  if (!GetIt.I.isRegistered<TipRepository>()) {
    locator.registerLazySingleton<TipRepository>(
        () => TipRepositoryImpl(locator()));
  }

  if (!GetIt.I.isRegistered<TipGetAllUseCase>()) {
    locator
        .registerFactory<TipGetAllUseCase>(() => TipGetAllUseCase(locator()));
  }

  if (!GetIt.I.isRegistered<TipAddOrUpdateUseCase>()) {
    locator.registerFactory<TipAddOrUpdateUseCase>(
        () => TipAddOrUpdateUseCase(locator()));
  }

  if (!GetIt.I.isRegistered<TipDeleteUseCase>()) {
    locator
        .registerFactory<TipDeleteUseCase>(() => TipDeleteUseCase(locator()));
  }
}
//REFRESH TOKEN
