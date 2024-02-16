import 'package:flutter/material.dart';
import 'package:voco_riverpod_mvc/product/model/users/user_model.dart';
import 'package:voco_riverpod_mvc/product/widget/network_image/project_network_image.dart';

class UserListTile extends StatelessWidget {
  const UserListTile({
    super.key,
    required this.userModel,
  });

  final UserModel userModel;

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Theme.of(context).colorScheme.surface,
        child: ListTile(
          title: Text(
            userModel.lastName,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          leading: ProjectNetworkImage(
            imagePath: userModel.avatar,
          ),
        ));
  }
}
