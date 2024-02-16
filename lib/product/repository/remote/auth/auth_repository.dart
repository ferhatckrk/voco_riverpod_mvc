import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:voco_riverpod_mvc/product/model/auth/login/login_request_model.dart';
import 'package:voco_riverpod_mvc/product/model/auth/token/token_model.dart';
import 'package:voco_riverpod_mvc/product/model/error/service_error.dart';
import 'package:voco_riverpod_mvc/product/network/project_service_path.dart';

abstract class IAuthRepository {
  Future<Either<ServiceError, TokenModel>> login(
      LoginRequestModel loginRequestModel);
}

class AuthRepository implements IAuthRepository {
  final Dio _networkManager;
  AuthRepository(Dio networkManager) : _networkManager = networkManager;

  @override
  Future<Either<ServiceError, TokenModel>> login(
      LoginRequestModel loginRequestModel) async {
    try {
      final response = await _networkManager.post(ProjectNetworkPath.login.path,
          data: loginRequestModel.toJson());

      if (response.statusCode == HttpStatus.ok) {
        return Right(TokenModel.fromJson(response.data));
      }
      return Left(ServiceError.fromJson(response.data));
    } on DioException catch (e) {
      return Left(ServiceError.fromJson(e.response!.data));
    }
  }
}
