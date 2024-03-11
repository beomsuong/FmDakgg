import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fmdakgg/player_search/match_results_widget.dart';
import 'package:fmdakgg/player_search/game_info_model.dart';
import 'package:fmdakgg/player_search/match_results_view_model.dart';

final matchResultsViewModelProvider =
    StateNotifierProvider<MatchResultsViewModel, AsyncValue<GameInfoModel>>(
        (ref) {
  return MatchResultsViewModel();
});

class PlayerSearch extends ConsumerStatefulWidget {
  final String nickname;
  const PlayerSearch({required this.nickname, super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PlayerSearchState();
}

class _PlayerSearchState extends ConsumerState<PlayerSearch> {
  @override
  void initState() {
    super.initState();
    ref
        .read(matchResultsViewModelProvider.notifier)
        .fetchGameData(widget.nickname);
  }

  @override
  Widget build(BuildContext context) {
    final gameInfoAsyncValue = ref.watch(matchResultsViewModelProvider);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              gameInfoAsyncValue.when(
                data: (data) => MatchResultsWidget(
                    gameInfo: data), // MatchResultsWidget 업데이트 필요
                loading: () => const CircularProgressIndicator(),
                error: (error, stack) => Text('Error: $error'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
