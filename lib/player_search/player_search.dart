import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fmdakgg/player_search/match_results_widget.dart';

class PlayerSearch extends ConsumerStatefulWidget {
  final String nickname;
  const PlayerSearch({required this.nickname, super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PlayerSearchState();
}

class _PlayerSearchState extends ConsumerState<PlayerSearch> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            MatchResultsWidget(),
          ],
        ),
      )),
    );
  }
}
