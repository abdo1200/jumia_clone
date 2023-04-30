import 'package:get_it/get_it.dart';
import 'package:jumia_clone/authentication/data/datasource/user_remote_datasource.dart';
import 'package:jumia_clone/authentication/data/repository/user_repository.dart';
import 'package:jumia_clone/authentication/domain/repository/base_user_repository.dart';
import 'package:jumia_clone/authentication/domain/usecases/check_auth_usecase.dart';
import 'package:jumia_clone/authentication/domain/usecases/email_login_usecase.dart';
import 'package:jumia_clone/authentication/domain/usecases/facebook_login_usecase.dart';
import 'package:jumia_clone/authentication/domain/usecases/sign_up_usecase.dart';
import 'package:jumia_clone/authentication/presentation/controller/user_bloc.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    /// Bloc
    sl.registerFactory(() => UserBloc(sl(), sl(), sl(), sl()));
    // sl.registerFactory(() => MovieDetailsBloc(sl(), sl()));

    /// Use Cases
    sl.registerLazySingleton(() => FacebookLoginUseCase(sl()));
    sl.registerLazySingleton(() => CheckAuthUseCase(sl()));
    sl.registerLazySingleton(() => SignUpUseCase(sl()));
    sl.registerLazySingleton(() => EmailLoginUseCase(sl()));

    /// Repository
    sl.registerLazySingleton<BaseUserRepository>(() => UserRepository(sl()));

    /// DATA SOURCE
    sl.registerLazySingleton<BaseUserRemoteDataSource>(
        () => UserRemoteDataSource());
  }
}
