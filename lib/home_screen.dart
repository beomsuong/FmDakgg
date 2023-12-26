import 'package:flutter/material.dart';

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
              ),
              Wrap(children: [
                for (int i = 0; i < 10; i++)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Container(
                          height: 60,
                          width: 60,
                          color: Colors.black,
                        ),
                        const Text('캐릭터')
                      ],
                    ),
                  ),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
