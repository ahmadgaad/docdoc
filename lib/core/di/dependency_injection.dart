import 'package:docdoc/core/networking/api_service.dart';
import 'package:docdoc/core/networking/dio_factory.dart';
import 'package:docdoc/features/login/data/repository/login_repository.dart';
import 'package:docdoc/features/login/presentation/controller/login_cubit.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;
Future<void> initGetIt() async {
  // login
  sl.registerLazySingleton<LoginRepo>(() => LoginRepoImpl(apiService: sl()));
  //TODO: if there is error occured cause I make cubit lazy singleton I will make it factory pattern.
  sl.registerLazySingleton(() => LoginCubit(sl()));

  //! EXTERNAL
  final dio = DioFactory.getDio();
  sl.registerLazySingleton<ApiService>(() => ApiService(dio));
}
