// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_final_fields

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:voco_riverpod_mvc/product/model/users/user_model.dart';
import 'package:voco_riverpod_mvc/product/model/users/users_response_model.dart';
import 'package:voco_riverpod_mvc/product/repository/remote/home/user_repository.dart';

import '../../../../product/utilities/enum/project_enums.dart';

class ParticipantsController extends StateNotifier<ProjectState> {
  ParticipantsController(UserRepository userRepository)
      : _userRepository = userRepository,
        super(ProjectState.initial);
  final UserRepository _userRepository;

  List<UserModel> _users = [];
  UsersResponseModel _usersResponseModel = UsersResponseModel(
    page: 0,
    perPage: 0,
    total: 0,
    totalPages: 0,
    data: [],
  );

  List<UserModel> get users => _users;

  UsersResponseModel get usersResponseModel => _usersResponseModel;

  Future<void> getUsers(String page) async {
    state = ProjectState.loading;
    final result = await _userRepository.getUsers(page);

    result.fold((serviceError) {
      state = ProjectState.error;
    }, (userResponseModel) {
      _usersResponseModel = userResponseModel;
      _users.addAll(userResponseModel.data);
      state = ProjectState.success;
    });
  }
}
