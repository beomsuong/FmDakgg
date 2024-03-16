// import 'package:dio/dio.dart';
// import 'package:fmdakgg/model/userInfo_model.dart';
// import 'package:fmdakgg/player_search/game_info_model.dart';
// import 'package:riverpod/riverpod.dart';

// final counterProvider =
//     StateNotifierProvider<CounterController, GameInfoModel>((ref) {
//   return CounterController();
// });

// class CounterController extends StateNotifier<GameInfoModel> {
//   CounterController() : super(GameInfoModel());
//   final dio = Dio();
//   Future<void> getGameData(String nickName) async {
//     try {
//       var response = await dio.get('http://10.0.2.2:3000/player/$nickName');
//       if (response.statusCode == 200) {
//         state = GameInfoModel.fromJson(response.data);
//         print(GameInfoModel.fromJson(response.data).userGames);
//       } else {
//         print("${response.statusCode}");
//       }
//     } catch (e) {
//       print("Exception $e");
//     }
//   }

//   void decrement() {}
// }
