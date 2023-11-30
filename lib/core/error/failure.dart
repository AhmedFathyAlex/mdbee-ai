import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String authErrorMessageModel;
 const Failure(this.authErrorMessageModel);
 

  @override
  List<Object> get props => [authErrorMessageModel];
}
