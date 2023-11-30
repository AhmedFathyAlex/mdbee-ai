import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mdbee_ai/core/service/remote/service_locator.dart';
import 'package:mdbee_ai/features/authentication/blocs/auth_cubit.dart';
import 'package:mdbee_ai/features/authentication/ui/screens/login_screen.dart';
import 'flavors.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(400, 650),
      child: MaterialApp(
        title: F.title,
        home: BlocProvider(
          create: (context) => ServiceLocator.instance<AuthenticationCubit>(),
          child: LoginScreen(),
        ),
      ),
    );
  }
}
