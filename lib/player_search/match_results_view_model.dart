import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fmdakgg/model/userInfo_model.dart';
import 'package:fmdakgg/player_search/game_info_model.dart'; // 정확한 경로로 수정

class MatchResultsViewModel extends StateNotifier<AsyncValue<GameInfoModel>> {
  final Dio dio = Dio();

  MatchResultsViewModel() : super(const AsyncValue.loading()) {
    fetchGameData('initialNickname');
  }

  Future<void> fetchGameData(String nickname) async {
    state = const AsyncValue.loading();

    try {
      final response = await dio.get('http://10.0.2.2:3000/player/aasam');
      if (response.statusCode == 200) {
        final gameInfo = GameInfoModel.fromJson(response.data);
        print(GameInfoModel.fromJson(response.data).userGames![0].toJson());
        for (var data in GameInfoModel.fromJson(response.data).userGames!) {
          if (data.userNum == 418355) {}
        }
        state = AsyncValue.data(gameInfo);
      } else {
        state = AsyncValue.error(
            Exception(
                "Failed to load game data with status code: ${response.statusCode}"),
            StackTrace.current);
      }
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
    }
  }
}
