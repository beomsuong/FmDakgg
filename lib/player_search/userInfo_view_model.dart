import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fmdakgg/model/gameInfo_model.dart';

class UserInfoViewModel extends StateNotifier<AsyncValue<UserInfoViewModel>> {
  final Dio dio = Dio();
  final String nickname;
  UserInfoViewModel(this.nickname) : super(const AsyncValue.loading()) {
    fetchGameData(nickname);
  }

  Future<void> fetchGameData(String nickname) async {
    state = const AsyncValue.loading();

    try {
      final response =
          await dio.get('http://10.0.2.2:3000/v1/user/stats/aasam');
      if (response.statusCode == 200) {
        state = AsyncValue.data(response.data);
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
