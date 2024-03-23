import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fmdakgg/model/gameInfo_model.dart';
import 'package:fmdakgg/player_search/match_results_widget.dart';
import 'package:fmdakgg/player_search/match_results_view_model.dart';

class PlayerSearch extends ConsumerStatefulWidget {
  final String nickname;
  const PlayerSearch({required this.nickname, super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PlayerSearchState();
}

class _PlayerSearchState extends ConsumerState<PlayerSearch> {
  final matchResultsViewModelProvider = StateNotifierProvider.family<
      MatchResultsViewModel, AsyncValue<List<GameInfoModel>>, String>(
    (ref, nickname) {
      return MatchResultsViewModel(nickname);
    },
  );
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final gameInfoAsyncValue =
        ref.watch(matchResultsViewModelProvider(widget.nickname));
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              gameInfoAsyncValue.when(
                data: (gameInfoList) {
                  final widgets = gameInfoList
                      .where((gameInfo) =>
                          (gameInfo).userGames!.length > 8) // 8보다 크면 루미아섬
                      .map((gameInfo) {
                    return MatchResultsWidget(gameInfo: gameInfo);
                  }).toList();

                  final displayedWidgets =
                      widgets.length > 10 ? widgets.sublist(0, 10) : widgets;
                  return Column(
                    children: displayedWidgets,
                  );
                },
                loading: () => const CircularProgressIndicator(),
                error: (error, stack) => Text('Error: $error'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
