import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:mdbee_ai/core/service/remote/service_locator.dart';
import 'package:mdbee_ai/core/utils/bloc_observer.dart';
import 'app.dart';

FutureOr<void> main() async {
  // WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  Bloc.observer = MyBlocObserver();
  ServiceLocator.init();
  runApp(const App());
}