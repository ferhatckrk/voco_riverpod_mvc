import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:voco_riverpod_mvc/features/home/participants/view/mixin/participants_view_mixin.dart';
import 'package:voco_riverpod_mvc/features/home/participants/widget/user_list_tile.dart';
import 'package:voco_riverpod_mvc/product/provider/providers.dart';
import 'package:voco_riverpod_mvc/product/utilities/enum/project_enums.dart';

class ParticipantsView extends ConsumerStatefulWidget {
  static const String routeName = "/participants-view";
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
                itemBuilder: (context, index) => UserListTile(
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
