import 'package:firebase_auth/firebase_auth.dart';
import 'package:fmdakgg/firebase_auth_remote_data_source.dart';
import 'package:fmdakgg/social_login.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart' as kakao;

class MainViewModel {
  final _firebaseAuthDataSource = FirebaseAuthRemoteDataSource();
  final SocialLogin _socialLogin;
  bool isLogined = false;
  kakao.User? user;

  MainViewModel(this._socialLogin);

  Future login() async {
    isLogined = await _socialLogin.login();
    if (isLogined) {
      user = await kakao.UserApi.instance.me();

      final token = await _firebaseAuthDataSource.createCustomToken({
        'uid': user!.id.toString(),
        'displayName': '카카오닉',
        'email': 'kakaoemail@gmail.com',
        'photoURL':
            'https://i.ytimg.com/vi/jZA4i-PWiSo/hqdefault.jpg?sqp=-oaymwE2CNACELwBSFXyq4qpAygIARUAAIhCGAFwAcABBvABAfgB_gmAAtAFigIMCAAQARhiIGUoTjAP&rs=AOn4CLB4qH7J7s2mxD7Rul75GCMyCjSXtw',
      });
      print("리턴 $token");
      await FirebaseAuth.instance.signInWithCustomToken(token);
      print("테스트 ${FirebaseAuth.instance.currentUser!.uid}");
    }
  }

  Future logout() async {
    await _socialLogin.logout();
    await FirebaseAuth.instance.signOut();
    isLogined = false;
    user = null;
  }
}
