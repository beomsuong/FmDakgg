import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fmdakgg/model/userInfo_model.dart';
import 'package:fmdakgg/player_search/match_results_widget.dart';
import 'package:fmdakgg/player_search/match_results_view_model.dart';

final matchResultsViewModelProvider = StateNotifierProvider<
    MatchResultsViewModel, AsyncValue<List<GameInfoModel>>>((ref) {
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
                data: (gameInfoList) {
                  // GameInfoModel 리스트에서 MatchResultsWidget 리스트 생성
                  final widgets = gameInfoList.map((gameInfo) {
                    return MatchResultsWidget(gameInfo: gameInfo);
                  }).toList();

                  // 10개의 위젯만 표시하도록 제한 (리스트의 길이가 10보다 작은 경우 전체 리스트 사용)
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
