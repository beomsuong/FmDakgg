import 'package:dio/dio.dart';

class MatchResultModel {
  final dio = Dio();

  Future test() async {
    print("시작");
    Response response;
    response = await dio.get('http://10.0.2.2:3000/player/닉네임');
    print('응답 ${response.data.toString()}');
    print(response.data.toString());
  }
}
