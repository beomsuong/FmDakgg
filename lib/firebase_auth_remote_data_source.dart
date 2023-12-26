import 'package:http/http.dart' as http;

class FirebaseAuthRemoteDataSource {
  final String url =
      'https://us-central1-fmdakgg.cloudfunctions.net/createCustomToken';

  Future<String> createCustomToken(Map<String, dynamic> user) async {
    final customTokenResponse = await http.post(Uri.parse(url), body: user);
    print("리턴결과 ${customTokenResponse.body}");
    return customTokenResponse.body;
  }
}
