import 'package:flutter/material.dart';

class NewsWidet extends StatelessWidget {
  const NewsWidet({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return mediaQuery.size.width < 830
        ? Stack(children: [
            SizedBox(
              width: mediaQuery.size.width,
              height: 180,
              child: Image.asset(
                './assets/imgs/news.jpg',
                fit: BoxFit.cover,
              ),
            ),
            const Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.all(5.0),
                child: Center(
                  child: Text(
                    'Masr kesbt almanya 18-0 fe mobarah tarekhya lm yashhadha el tarekh\Masr kesbt almany 18-0 fe mobarah tarekhya lm yashhadha el tarekh Masr kesbt almany 18-0 fe mobarah tarekhya lm yashhadha el tarekh ',
                    softWrap: true,
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                        overflow: TextOverflow.clip, color: Colors.white),
                  ),
                ),
              ),
            ),
          ])
        : InkWell(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.all(5),
              // height: 200,
              // width: 150,
              child: Card(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                        height: 180,
                        child: Image.asset(
                          './assets/imgs/news.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Center(
                          child: Text(
                            'Masr kesbt almanya 18-0 fe mobarah tarekhya lm yashhadha el tarekh\Masr kesbt almany 18-0 fe mobarah tarekhya lm yashhadha el tarekh Masr kesbt almany 18-0 fe mobarah tarekhya lm yashhadha el tarekh ',
                            softWrap: true,
                            overflow: TextOverflow.clip,
                            style: TextStyle(
                              overflow: TextOverflow.clip,
                            ),
                          ),
                        ),
                      ),
                    ]),
              ),
            ),
          );
  }
}
