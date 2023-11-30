import 'package:mdbee_ai/core/error/failure.dart';

class ServerExceptions implements Exception {
  final String errorMessageModel;
  ServerExceptions({
    required this.errorMessageModel,
  });
}

class OtpExceptions implements Exception {
  final String errorExceptions;

  OtpExceptions({required this.errorExceptions});
}

// if worke with local data source
class LocalDataBaseException implements Exception {
  final String errorMessageModel;
  LocalDataBaseException({
    required this.errorMessageModel,
  });
}

class ServerFailure extends Failure {
  const ServerFailure(super.authErrorMessageModel);
}

class LocalDataBaseFailure extends Failure {
  const LocalDataBaseFailure(super.message);
}
