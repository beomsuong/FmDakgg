import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              GestureDetector(
                  onTap: () async {
                    // 카카오톡이 설치되어 있으면 카카오톡으로 로그인, 아니면 카카오계정으로 로그인
                    if (await isKakaoTalkInstalled()) {
                      try {
                        await UserApi.instance.loginWithKakaoTalk();
                        print('카카오톡으로 로그인 성공');
                      } catch (error) {
                        print('카카오톡으로 로그인 실패 $error');

                        // 사용자가 카카오톡 설치 후 디바이스 권한 요청 화면에서 로그인을 취소한 경우,
                        // 의도적인 로그인 취소로 보고 카카오계정으로 로그인 시도 없이 로그인 취소로 처리 (예: 뒤로 가기)
                        if (error is PlatformException &&
                            error.code == 'CANCELED') {
                          return;
                        }
                        // 카카오톡에 연결된 카카오계정이 없는 경우, 카카오계정으로 로그인
                        try {
                          await UserApi.instance.loginWithKakaoAccount();
                          print('카카오계정으로 로그인 성공');
                        } catch (error) {
                          print('카카오계정으로 로그인 실패 $error');
                        }
                      }
                    } else {
                      try {
                        await UserApi.instance.loginWithKakaoAccount();
                        print('카카오계정으로 로그인 성공');
                      } catch (error) {
                        print('카카오계정으로 로그인 실패 $error');
                      }
                    }
                  },
                  child: const Text('로그인')),
              Container(
                color: const Color.fromARGB(234, 13, 13, 13),
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    children: [
                      const Row(
                        children: [
                          Text(
                            'FmDak.gg',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.w900),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(5),
                            ),
                            border: Border.all(color: Colors.black, width: 1),
                          ),
                          child: const TextField(
                            style: TextStyle(fontSize: 14, color: Colors.white),
                            textAlign: TextAlign.left,
                            decoration: InputDecoration(
                              hintText: '플레이어 닉네임을 입력해주세요.',
                              hintStyle: TextStyle(
                                fontSize: 14,
                                color: Colors.white54,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      '실험체',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 24,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                        height: 50,
                        color: const Color.fromARGB(234, 13, 13, 13),
                        child: const Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 30),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '실험체 목록',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 8.0),
                                  child: SizedBox(
                                    width: 130,
                                    child: TextField(
                                      style: TextStyle(
                                        color: Colors.grey,
                                      ),
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colors.white,
                                        hintText: '실험체 검색 (수아, ㅅㅇ)',
                                        hintStyle:
                                            TextStyle(color: Colors.grey),
                                        border: InputBorder.none, // 테두리 없애기
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
