
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:mdbee_ai/features/authentication/blocs/auth_states.dart';
import 'package:mdbee_ai/features/authentication/data/models/user_model.dart';
import 'package:mdbee_ai/features/authentication/data/repository/auth_repository.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  UserModel? user;
  AuthenticationCubit() : super(AuthenticationInitial());

  void loginWithEmail({required String email, required String password}) async {
      try{
         var response = await AuthinticationRepository.loginWithEmail(
        email: email,
        password: password,
      );
      response.fold((failure) {
        emit(AuthenticationFailure(error: failure.authErrorMessageModel));
      },
      (response){
      emit(AuthenticationSuccess());
      user = UserModel.fromMap(response['user']);
      log('New User Data : $user');
      });
      }
      catch(e){
        log('Error $e');
      }

  }

  void signOut() async {
    emit(AuthenticationInitial());
  }
}
