import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fmdakgg/model/userInfo_model.dart';

class MatchResultsViewModel
    extends StateNotifier<AsyncValue<List<GameInfoModel>>> {
  final Dio dio = Dio();
  final String nickname;
  MatchResultsViewModel(this.nickname) : super(const AsyncValue.loading()) {
    fetchGameData(nickname);
  }

  Future<void> fetchGameData(String nickname) async {
    state = const AsyncValue.loading();

    final responseNum = await dio.get('http://10.0.2.2:3000/v1/user/num/aasam');

    try {
      final response = await dio.get('http://10.0.2.2:3000/player/aasam',
          queryParameters: {'nickname': nickname});

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
