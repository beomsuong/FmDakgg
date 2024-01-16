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
      child: SizedBox(
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
                children: [
                  Text(
                    '승리',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text('코발트'),
                  Text('09:04'),
                  Text('1시간 전'),
                ],
              ),
              const SizedBox(
                width: 500,
                child: Divider(
                  color: Colors.red,
                  thickness: 2.0,
                ),
              ),
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
                  Column(
                    children: [
                      Container(
                        color: Colors.purple,
                        width: 15,
                        height: 15,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        color: Colors.pink,
                        width: 15,
                        height: 15,
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
