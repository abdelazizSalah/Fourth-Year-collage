import 'package:flutter/material.dart';

class MatchWidget extends StatelessWidget {
  const MatchWidget({
    super.key,
    required this.team1,
    required this.team2,
    required this.date,
    required this.team1Img,
    required this.team2Img,
  });
  final String team1;
  final String team2;
  final String date;
  final team1Img;
  final team2Img;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text('Egyption League'),
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
                  const Text('VS'),
                  Column(
                    children: [
                      SizedBox(
                        height: 50,
                        width: 80,
                        child: Image.asset(team2Img,
                          fit: BoxFit.contain,
                        ),
                      ),
                      Text(team2),
                    ],
                  ),
                ]),
            Text(date),
          ],
        ),
      ),
    );
  }
}
