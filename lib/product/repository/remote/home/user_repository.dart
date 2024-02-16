import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:voco_riverpod_mvc/product/model/error/service_error.dart';
import 'package:voco_riverpod_mvc/product/model/users/users_response_model.dart';
import 'package:voco_riverpod_mvc/product/network/project_service_path.dart';

abstract class IUserRepository {
  Future<Either<ServiceError, UsersResponseModel>> getUsers(String page);
}

class UserRepository implements IUserRepository {
  final Dio _networkManager;

  UserRepository(Dio networkManager) : _networkManager = networkManager;

  @override
  Future<Either<ServiceError, UsersResponseModel>> getUsers(String page) async {
    try {
      final response =
          await _networkManager.get(ProjectNetworkPath.users.withQuery(page));

      if (response.statusCode == HttpStatus.ok) {
        return Right(UsersResponseModel.fromJson(response.data));
      }
      return Left(ServiceError.fromJson(response.data));
    } on DioException catch (e) {
      return Left(ServiceError.fromJson(e.response!.data));
    }
  }
}
