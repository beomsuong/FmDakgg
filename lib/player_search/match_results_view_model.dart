import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fmdakgg/model/userInfo_model.dart';

class MatchResultsViewModel
    extends StateNotifier<AsyncValue<List<GameInfoModel>>> {
  final Dio dio = Dio();

  MatchResultsViewModel() : super(const AsyncValue.loading()) {
    fetchGameData('initialNickname');
  }

  Future<void> fetchGameData(String nickname) async {
    state = const AsyncValue.loading();
    print("실행");
    final responseNum = await dio.get('http://10.0.2.2:3000/v1/user/num/aasam');
    print("실행 ${responseNum.data}");
    print("실행 ${responseNum.data['user']['userNum']}");

    try {
      final response = await dio.get('http://10.0.2.2:3000/player/aasam');

      if (response.statusCode == 200) {
        final gameInfoList = List<GameInfoModel>.from((response.data as List)
            .map((item) => GameInfoModel.fromJson(item,
                userNum: responseNum.data['user']['userNum'])));
        state = AsyncValue.data(gameInfoList);
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
