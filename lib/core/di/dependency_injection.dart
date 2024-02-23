import 'package:docdoc/core/networking/api_service.dart';
import 'package:docdoc/core/networking/dio_factory.dart';
import 'package:docdoc/features/login/data/repository/login_repository.dart';
import 'package:docdoc/features/login/presentation/controller/login_cubit.dart';
import 'package:docdoc/features/sign_up/data/repository/sign_up_repository.dart';
import 'package:docdoc/features/sign_up/presentation/controller/sign_up_cubit.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;
Future<void> initGetIt() async {
  // login
  sl.registerLazySingleton<LoginRepo>(() => LoginRepoImpl(apiService: sl()));
  sl.registerFactory(() => LoginCubit(sl()));

  // signup
  sl.registerLazySingleton<SignUpRepository>(() => SignUpRepositoryImpl(apiService: sl()));
  sl.registerFactory(() => SignUpCubit(sl()));

  //! EXTERNAL
  final dio = DioFactory.getDio();
  sl.registerLazySingleton<ApiService>(() => ApiService(dio));
}
