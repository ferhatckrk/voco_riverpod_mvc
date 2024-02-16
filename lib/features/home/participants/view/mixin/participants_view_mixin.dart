import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:voco_riverpod_mvc/features/home/participants/view/participants_view.dart';
import 'package:voco_riverpod_mvc/product/provider/providers.dart';

mixin ParticipantsViewMixin on ConsumerState<ParticipantsView> {
  late ScrollController scrollController;
  int page = 1;

  @override
  void initState() {
    scrollController = ScrollController();
   scrollController.addListener(_scrollListener);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .read(participantsControllerProvider.notifier)
          .getUsers((page++).toString());
    });
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      print("call");
      page =page + 1;
      ref
          .watch(participantsControllerProvider.notifier)
          .getUsers(page.toString());
    } else {
      print("dont call");
    }
  }
}
