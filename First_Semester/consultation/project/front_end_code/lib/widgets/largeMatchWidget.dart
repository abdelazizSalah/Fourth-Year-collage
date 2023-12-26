import 'package:flutter/material.dart';

class LargeMatchWidget extends StatelessWidget {
  const LargeMatchWidget({
    super.key,
    required this.team1,
    required this.team2,
    required this.team1Img,
    required this.team2Img,
    required this.date,
    required this.lineMan1,
    required this.lineMan2,
    required this.refree,
  });
  final team1Img;
  final team1;
  final team2;
  final team2Img;
  final date;
  final refree;
  final lineMan1;
  final lineMan2;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Text('Egyption League'),
          const SizedBox(
            height: 20,
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.min,
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 50,
                      width: 80,
                      child: Image.asset(
                        team1Img,
                        fit: BoxFit.contain,
                      ),
                    ),
                    Text(team1),
                  ],
                ),
                const SizedBox(
                  width: 50,
                ),
                const Text('VS'),
                const SizedBox(
                  width: 50,
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 50,
                      width: 80,
                      child: Image.asset(
                        team2Img,
                        fit: BoxFit.contain,
                      ),
                    ),
                    Text(team2),
                  ],
                ),
              ]),
          const SizedBox(
            height: 20,
          ),
          const Text("15:30 PM"),
          const SizedBox(
            height: 8,
          ),
          Text(date),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                lineMan1,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                refree,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                lineMan2,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const Text("Santiago Bernabeu"),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
