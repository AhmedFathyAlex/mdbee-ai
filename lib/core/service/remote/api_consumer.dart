import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:mdbee_ai/core/error/exceptions.dart';
import 'package:mdbee_ai/core/error/failure.dart';
import 'package:mdbee_ai/core/service/remote/dio_consumer.dart';
import 'package:mdbee_ai/core/service/remote/end_points.dart';


class ApiConsumer extends DioConsumer {
  factory ApiConsumer() => _instance;

  static final ApiConsumer _instance = ApiConsumer._internal();

  ApiConsumer._internal() {
    _dio = Dio();
    _dio.options.baseUrl = EndPoints.baseUrl();
    _dio.options.receiveTimeout = 
        const Duration(milliseconds: EndPoints.receiveTimeout);
    _dio.options.connectTimeout =
        const Duration(milliseconds: EndPoints.connectionTimeout);

    // _dio.interceptors.add(
    //   ApiInterceptor(),
    // );
    if (kDebugMode) {
      _dio.interceptors.add(
        LogInterceptor(
          responseBody: true,
          requestBody: true,
          logPrint: (Object? object) => log(object.toString(), name: 'HTTP'),
        ),
      );
    }
  }

  late final Dio _dio;

  @override
  Future<Either<Failure, dynamic>> delete(
    String uri, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? data,
    FormData? formData,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _instance._dio.delete(
        uri,
        queryParameters: queryParameters,
        data: data ?? formData,
        options: options,
        cancelToken: cancelToken,
      );
      return Right(response.data);
    } on DioException catch (exception) {
      return Left(
        ServerFailure(
          exception.message.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, dynamic>> download(
    String uri,
    String savePath, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? data,
    FormData? formData,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await _instance._dio.download(
        uri,
        savePath,
        queryParameters: queryParameters,
        data: data ?? formData,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return Right(response.data);
    } on DioException catch (exception) {
      return Left(
        ServerFailure(
         exception.message.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, dynamic>> get(
    String uri, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? data,
    FormData? formData,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await _instance._dio.get(
        uri,
        data: data ?? formData,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return Right(response.data);
    } on DioException catch (exception) {
      return Left(
        ServerFailure(
         exception.message.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, dynamic>> head(
    String uri, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? data,
    FormData? formData,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _instance._dio.head(
        uri,
        queryParameters: queryParameters,
        data: data ?? formData,
        options: options,
        cancelToken: cancelToken,
      );
      return Right(response.data);
    } on DioException catch (exception) {
      return Left(
        ServerFailure(
         exception.message.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, dynamic>> patch(
    String uri, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? data,
    FormData? formData,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await _instance._dio.patch(
        uri,
        queryParameters: queryParameters,
        data: data ?? formData,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
        onSendProgress: onSendProgress,
      );
      return Right(response.data);
    } on DioException catch (exception) {
      return Left(
        ServerFailure(
         exception.message.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, dynamic>> post(
    String uri, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? data,
    FormData? formData,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await _instance._dio.post(
        uri,
        queryParameters: queryParameters,
        data: data ?? formData,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
        onSendProgress: onSendProgress,
      );
      return Right(response.data);
    } on DioException catch (exception) {
      return Left(
        ServerFailure(
          exception.message.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, dynamic>> put(
    String uri, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? data,
    FormData? formData,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await _instance._dio.put(
        uri,
        queryParameters: queryParameters,
        data: data ?? formData,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
        onSendProgress: onSendProgress,
      );
      return Right(response.data);
    } on DioException catch (exception) {
      return Left(
        ServerFailure(
      exception.message.toString(),
        ),
      );
    }
  }

  // ErrorMessageModel _handleError(DioException exception) {
  //   return ErrorMessageModel(
  //     en: exception.response?.data['localizedMessage']['en'] as String,
  //     ar: exception.response?.data['localizedMessage']['ar'] as String,
  //   );
  // }
}
