import 'package:dartz/dartz.dart';
import 'package:mdbee_ai/core/error/failure.dart';
import 'package:mdbee_ai/core/service/remote/api_consumer.dart';
import 'package:mdbee_ai/core/service/remote/end_points.dart';
class AuthinticationRepository{
static final apiClient = ApiConsumer();

  static Future<Either<Failure, dynamic>>loginWithEmail({required String email,required String password}){
    var response = apiClient.post(EndPoints.loginWithMail,data: {
      'email':email,
      'password':password
    });
    
  return response;
  }
  
}