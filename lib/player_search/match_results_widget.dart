import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fmdakgg/model/userInfo_model.dart';

class MatchResultsWidget extends StatefulWidget {
  final GameInfoModel gameInfo;
  const MatchResultsWidget({super.key, required this.gameInfo});

  @override
  State<MatchResultsWidget> createState() => _MatchResultsWidgetState();
}

class _MatchResultsWidgetState extends State<MatchResultsWidget> {
  late UserGames userData;
  @override
  void initState() {
    for (var data in widget.gameInfo.userGames!) {
      if (data.userNum == 418355) {
        userData = data;
        break;
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 120.h,
        width: 411.w,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(5.0)),
          border: Border.all(
            color: Colors.black,
            width: 1,
          ),
        ),
        child: Row(
          children: [
            Container(
              height: 120.h,
              width: 10.w,
              color: Colors.amber,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Colors.grey),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 30,
                        width: 380.w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.baseline,
                                  textBaseline: TextBaseline.alphabetic,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    const Text(
                                      '승리',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    const Text(' 코발트'),
                                    const Text(
                                      ' 09:04',
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    const Text(
                                      ' 1시간 전',
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ],
                                ),
                                GestureDetector(
                                    onTap: () {},
                                    child: const Icon(
                                        Icons.keyboard_arrow_down_sharp))
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 380.w,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Row(
                              children: [
                                Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius:
                                          BorderRadius.circular(100.0),
                                      child: Container(
                                        color: Colors.amber,
                                        width: 40,
                                        height: 40,
                                      ),
                                    ),
                                    Positioned(
                                      top: 25,
                                      left: 25,
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(100.0),
                                        child: Container(
                                          color: Colors.red,
                                          width: 15,
                                          height: 15,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  children: [
                                    Container(
                                      color: Colors.purple,
                                      width: 15,
                                      height: 15,
                                    ),
                                    const SizedBox(
                                      height: 3,
                                    ),
                                    Container(
                                      color: Colors.pink,
                                      width: 15,
                                      height: 15,
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Column(
                                  children: [
                                    ClipRRect(
                                      borderRadius:
                                          BorderRadius.circular(100.0),
                                      child: Container(
                                        color: Colors.amber,
                                        width: 15,
                                        height: 15,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    ClipRRect(
                                      borderRadius:
                                          BorderRadius.circular(100.0),
                                      child: Container(
                                        color: Colors.amber,
                                        width: 15,
                                        height: 15,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          userData.teamKill.toString(),
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        const Text('/'),
                                        const Text(
                                          '6',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        const Text('/'),
                                        const Text(
                                          '10',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const Row(
                                      children: [
                                        Text(
                                          'TK',
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                        Text(
                                          '/',
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                        Text(
                                          'K',
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                        Text(
                                          '/',
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                        Text(
                                          'A',
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Container(
                                    height: 20,
                                    width: 25,
                                    color: Colors.pink,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Container(
                                    height: 20,
                                    width: 25,
                                    color: Colors.pink,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Container(
                                    height: 20,
                                    width: 25,
                                    color: Colors.pink,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Container(
                                    height: 20,
                                    width: 25,
                                    color: Colors.pink,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Container(
                                    height: 20,
                                    width: 25,
                                    color: Colors.pink,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Row(
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              children: [
                                Text('23,063'),
                                Text('딜량'),
                              ],
                            ),
                            const Row(
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              children: [
                                Text('1.78'),
                                Text('평점'),
                                Text('(KDA)'),
                              ],
                            ),
                            Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(100.0),
                                  child: Container(
                                    color: Colors.amber,
                                    width: 15,
                                    height: 15,
                                  ),
                                ),
                                const SizedBox(
                                  width: 2,
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(100.0),
                                  child: Container(
                                    color: Colors.amber,
                                    width: 15,
                                    height: 15,
                                  ),
                                ),
                                const SizedBox(
                                  width: 2,
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(100.0),
                                  child: Container(
                                    color: Colors.amber,
                                    width: 15,
                                    height: 15,
                                  ),
                                ),
                                const SizedBox(
                                  width: 2,
                                ),
                                const Text('인퓨전')
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
