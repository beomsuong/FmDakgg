import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
              const Text('랭크'),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100.0),
                    child: Container(
                      color: Colors.grey,
                      width: 70.w,
                      height: 70.h,
                    ),
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('6659 RP'),
                      Text('데미갓 - 2256RP'),
                      Text('647위')
                    ],
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [Text('평균 TK'), Text('7.8')],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [Text('승률'), Text('16.8%')],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [Text('게임 수 '), Text('179')],
                    )
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [Text('평균 TK'), Text('7.8')],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [Text('승률'), Text('16.8%')],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [Text('게임 수 '), Text('179')],
                    )
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [Text('평균 TK'), Text('7.8')],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [Text('승률'), Text('16.8%')],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [Text('게임 수 '), Text('179')],
                    )
                  ],
                ),
              ),
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
