import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fmdakgg/player_search/game_info_model.dart'; // 정확한 경로로 수정

class MatchResultsViewModel extends StateNotifier<AsyncValue<GameInfoModel>> {
  final Dio dio = Dio();

  MatchResultsViewModel() : super(const AsyncValue.loading()) {
    fetchGameData('initialNickname');
  }

  Future<void> fetchGameData(String nickname) async {
    state = const AsyncValue.loading();

          final response = await dio.get('http://10.0.2.2:3000/test');
  print("response ${response.data}");
  //   print("시작1");
  //   try {
  //     final response = await dio.get('http://10.0.2.2:3000/player/$nickname');
  //     if (response.statusCode == 200) {
  //       print("시작2");
  //       final gameInfo = GameInfoModel.fromJson(response.data);
  //       state = AsyncValue.data(gameInfo);
  //     } else {
  //       print("시작3");
  //       state = AsyncValue.error(
  //           Exception(
  //               "Failed to load game data with status code: ${response.statusCode}"),
  //           StackTrace.current);
  //     }
  //   } catch (e, stackTrace) {
  //     print("시작4 $e");
  //     state = AsyncValue.error(e, stackTrace); // 예외 객체와 스택 트레이스 전달
  //   }
  // }
}
}