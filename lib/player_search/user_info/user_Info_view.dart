import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fmdakgg/player_search/user_info/user_Info_model.dart';

class UserInfoView extends ConsumerStatefulWidget {
  final UserInfoModel userInfo;

  const UserInfoView({super.key, required this.userInfo});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UserInfoViewState();
}

class _UserInfoViewState extends ConsumerState<UserInfoView> {
  @override
  Widget build(BuildContext context) {
    print("프린트 ${widget.userInfo.userStats[0].mmr}");
    return Column(
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
                child: Image.network(
                    fit: BoxFit.fill, 'http://10.0.2.2:3000/rankTierIMGImage/'),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${widget.userInfo.userStats[0].mmr} RP'),
                const Text('데미갓 - 256RP'),
                Text(
                    '${widget.userInfo.userStats[0].rank}위 (상위 ${(widget.userInfo.userStats[0].rank / widget.userInfo.userStats[0].rankSize * 100).toStringAsFixed(2)})%')
              ],
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('평균 TK'),
                  Text((widget.userInfo.userStats[0].totalTeamKills /
                          widget.userInfo.userStats[0].totalGames)
                      .toStringAsFixed(2))
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('승률'),
                  Text(
                      '${(widget.userInfo.userStats[0].totalWins / widget.userInfo.userStats[0].totalGames * 100).toStringAsFixed(1)}%')
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('게임 수 '),
                  Text(widget.userInfo.userStats[0].totalGames.toString())
                ],
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('평균 킬'),
                  Text(widget.userInfo.userStats[0].averageKills.toString())
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('TOP 2'),
                  Text(widget.userInfo.userStats[0].top2.toString())
                ],
              ),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [Text('평균딜량 '), Text('초비상')],
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('평균 어시'),
                  Text(
                      widget.userInfo.userStats[0].averageAssistants.toString())
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('TOP 3'),
                  Text(widget.userInfo.userStats[0].top3.toString())
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('평균 순위'),
                  Text(
                      '#${widget.userInfo.userStats[0].averageRank.toString()}')
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
