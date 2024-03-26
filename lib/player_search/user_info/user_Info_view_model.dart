import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fmdakgg/player_search/user_info/user_Info_model.dart';

class UserInfoViewModel extends StateNotifier<AsyncValue<UserInfoModel>> {
  final Dio dio = Dio();
  final String nickName;

  UserInfoViewModel(this.nickName) : super(const AsyncValue.loading()) {
    fetchUserData(nickName);
  }

  Future<void> fetchUserData(String nickName) async {
    state = const AsyncValue.loading();
    try {
      final response =
          await dio.get('http://10.0.2.2:3000/v1/user/stats/$nickName');
      if (response.statusCode == 200) {
        print("유저 데이터 ${response.data}");
        final userInfo =
            UserInfoModel.fromJson(response.data); // UserInfo 모델 사용
        state = AsyncValue.data(userInfo);
      } else {
        state = AsyncValue.error(
            Exception(
                "Failed to load user data with status code: ${response.statusCode}"),
            StackTrace.current);
      }
    } catch (e, stackTrace) {
      print("유저데이터 실패 $e");
      state = AsyncValue.error(e, stackTrace);
    }
  }
}
