import 'package:get_it/get_it.dart';

import 'ModelsAndServices/services/api.dart';
import 'ModelsAndServices/services/authentication_service.dart';
import 'ModelsAndServices/viewmodels/comments_model.dart';
import 'ModelsAndServices/viewmodels/home_model.dart';
import 'ModelsAndServices/viewmodels/login_model.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => AuthenticationService());
  locator.registerLazySingleton(() => Api());

  locator.registerFactory(() => LoginModel());
  locator.registerFactory(() => HomeModel());
  locator.registerFactory(() => CommentsModel());
}