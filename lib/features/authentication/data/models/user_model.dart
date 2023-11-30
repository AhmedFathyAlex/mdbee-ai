// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
 final String? userName;
 final String? email;
 final String? firstName;
 final String? lastName;
 final int? pk;

  const UserModel({
    this.userName,
    this.email,
    this.firstName,
    this.lastName,
    this.pk,
  });
  
  @override
  List<Object?> get props {
    return [
      userName,
      email,
      firstName,
      lastName,
      pk,
    ];
  }

  

  UserModel copyWith({
    String? userName,
    String? email,
    String? firstName,
    String? lastName,
    int? pk,
  }) {
    return UserModel(
      userName: userName ?? this.userName,
      email: email ?? this.email,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      pk: pk ?? this.pk,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userName': userName,
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'pk': pk,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      userName: map['username'],
      email: map['email'] ,
      firstName: map['first_name'],
      lastName: map['last_name'] ,
      pk: map['pk'],
    );
  }

  @override
  bool get stringify => true;
}
