import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:voco_riverpod_mvc/features/home/participants/controller/participants_controller.dart';
import 'package:voco_riverpod_mvc/features/home/participants/view/mixin/participants_view_mixin.dart';
import 'package:voco_riverpod_mvc/features/home/participants/widget/user_list_tile.dart';
import 'package:voco_riverpod_mvc/product/provider/providers.dart';
import 'package:voco_riverpod_mvc/product/utilities/enum/project_enums.dart';
import 'package:voco_riverpod_mvc/product/widget/network_image/project_network_image.dart';

@RoutePage()
class ParticipantsView extends ConsumerStatefulWidget {
  const ParticipantsView({super.key});

  @override
  ConsumerState<ParticipantsView> createState() => _ParticipantsViewState();
}

class _ParticipantsViewState extends ConsumerState<ParticipantsView>
    with ParticipantsViewMixin {
  @override
  Widget build(BuildContext context) {
    final participantsController =
        ref.watch(participantsControllerProvider.notifier);
    final participantsControlleRef = ref.watch(participantsControllerProvider);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: scrollController,
                itemCount: participantsController.users.length,
                itemBuilder: (context, index) =>  UserListTile(
                      userModel: participantsController.users[index]),
                
              ),
            ),
            participantsControlleRef == ProjectState.loading
                ? const CircularProgressIndicator()
                : const SizedBox()
          ],
        ),
      ),
    );
  }
}
