import 'package:flutter/material.dart';

class NewsWidet extends StatelessWidget {
  const NewsWidet({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.all(5),
        height: 300,
        // width: 150,
        child: Card(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            SizedBox(
              height: 180,
              // width: 300,
              child: Image.asset(
                './assets/imgs/news.jpg',
                fit: BoxFit.cover,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                  'Masr kesbt almany 18-0 fe mobarah tarekhya lm yashhadha el tarekh\Masr kesbt almany 18-0 fe mobarah tarekhya lm yashhadha el tarekh\Masr kesbt almany 18-0 fe mobarah tarekhya lm yashhadha el tarekh '),
            ),
          ]),
        ),
      ),
    );
  }
}
