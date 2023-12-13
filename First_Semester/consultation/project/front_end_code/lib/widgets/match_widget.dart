import 'package:flutter/material.dart';

class MatchWidget extends StatelessWidget {
  const MatchWidget({super.key});

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
                          './assets/imgs/epl-logo.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                      const Text('Team 1'),
                    ],
                  ),
                  const Text('VS'),
                  Column(
                    children: [
                      SizedBox(
                        height: 50,
                        width: 80,
                        child: Image.asset(
                          './assets/imgs/epl-logo.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                      Text('Team 2'),
                    ],
                  ),
                ]),
            Text('Date'),
          ],
        ),
      ),
    );
  }
}
