import 'dart:ffi';

import 'package:flutter/material.dart';

class MatchResultsWidget extends StatefulWidget {
  const MatchResultsWidget({super.key});

  @override
  State<MatchResultsWidget> createState() => _MatchResultsWidgetState();
}

class _MatchResultsWidgetState extends State<MatchResultsWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(5.0)),
          border: Border.all(
            color: Colors.black,
            width: 1,
          ),
        ),
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          '승리',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(' 코발트'),
                        Text(' 091:04'),
                        Text(' 1시간 전'),
                      ],
                    ),
                    SizedBox(
                      width: 393,
                      child: Divider(
                        color: Colors.red,
                        thickness: 2.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(100.0),
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
                                borderRadius: BorderRadius.circular(100.0),
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
                              borderRadius: BorderRadius.circular(100.0),
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
                              borderRadius: BorderRadius.circular(100.0),
                              child: Container(
                                color: Colors.amber,
                                width: 15,
                                height: 15,
                              ),
                            ),
                          ],
                        ),
                        const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Text('25'),
                                Text('/'),
                                Text('6'),
                                Text('/'),
                                Text('10'),
                              ],
                            ),
                            Row(
                              children: [
                                Text('TK'),
                                Text('/'),
                                Text('K'),
                                Text('/'),
                                Text('A'),
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
          ],
        ),
      ),
    );
  }
}
