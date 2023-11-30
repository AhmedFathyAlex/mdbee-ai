import 'package:get_it/get_it.dart';
import 'package:mdbee_ai/core/service/local/service/simple_local_data.dart';
import 'package:mdbee_ai/features/authentication/blocs/auth_cubit.dart';


mixin ServiceLocator {
  static final instance = GetIt.instance;

  static void init() {
    //cubits
    instance.registerLazySingleton(() =>  AuthenticationCubit());
    // core
    instance.registerLazySingleton(() => const SimpleLocalData());

  }
}
