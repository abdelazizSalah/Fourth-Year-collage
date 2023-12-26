import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:front_end_code/models/match_model.dart';
import 'package:front_end_code/networks/constant_end_points.dart';
import 'package:front_end_code/networks/dio_helper.dart';
import 'package:front_end_code/screens/login_screen.dart';
import 'package:front_end_code/widgets/custom_snackbar.dart';
import 'package:front_end_code/widgets/match_widget.dart';
import 'package:front_end_code/widgets/newsWidget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  static const routeName = '/home_page';
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Widget homeTab() {
    final mediaQuery = MediaQuery.of(context);
    return Container(
      color: Colors.black87,
      child: ListView(
        children: [
          SizedBox(
              height: 150,
              child: getMatches
                  ? ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: matches.length,
                      itemBuilder: (context, index) {
                        return Container(
                            color: const Color.fromARGB(174, 255, 193, 7),
                            child: MatchWidget(
                              team1: matches[index].homeTeam!,
                              team2: matches[index].awayTeam!,
                              date: matches[index].date!,
                              team1Img: matches[index].homeTeamImg!,
                              team2Img: matches[index].awayTeamImg!,
                            ));
                      },
                    )
                  : const Center(child: CircularProgressIndicator())),
          const SizedBox(
            height: 10,
          ),
          Wrap(children: [
            SizedBox(
              height: mediaQuery.size.height,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: mediaQuery.size.width > 1100
                      ? 3
                      : mediaQuery.size.width > 1000
                          ? 2
                          : 1,
                  mainAxisExtent: mediaQuery.size.width > 1200
                      ? mediaQuery.size.width * 0.24
                      : mediaQuery.size.width > 800
                          ? mediaQuery.size.width * 0.3
                          : mediaQuery.size.width * 0.4,
                  crossAxisSpacing: 1,
                  childAspectRatio: 1,
                ),
                itemCount: 13,
                itemBuilder: (context, index) {
                  return Container(
                      alignment: Alignment.center,
                      color: const Color.fromARGB(127, 223, 194, 1),
                      child: const NewsWidet());
                },
              ),
            ),
          ]),
        ],
      ),
    );
  }

  Widget profileTab() {
    return Container(
      color: const Color.fromARGB(91, 76, 175, 79),
    );
  }

  Widget matchesTab() {
    return Container(
      color: const Color.fromARGB(91, 33, 149, 243),
    );
  }

  bool getMatches = false;
  List<matchModel> matches = [
    matchModel(
      homeTeam: 'El-Ahly',
      awayTeam: 'El-Zamalek',
      date: '12/12/2023',
      id: 2,
      linesman1: 'Ahmed Mohamed',
      linesman2: 'Mohamed Ahmed',
      referee: 'Ahmed khaled',
      homeTeamImg: './assets/imgs/ahly.png',
      awayTeamImg: './assets/imgs/zmalek.jpg',
    )
  ];
  void connectWithBackendLogin() async {
    print('try to get matches');
    final user;
    await DioHelper.getData(path: getHome).then((response) async {
      if (response.statusCode == 200) {
        var myMap = DioHelper.gettingJsonResponse(response);

        ScaffoldMessenger.of(context).showSnackBar(
            customSnackBar('Today we have a lot of interesting games!', true));
        // for (int i = 0; i < myMap.length; i++) {
        //   matches.add(matchModel.fromJson(myMap[i]));
        // }

        matches.add(matchModel.fromJson(myMap));
        matches[1].homeTeamImg = './assets/imgs/Masry.png';
        matches[1].awayTeamImg = './assets/imgs/pyramids.png';
        setState(() {
          getMatches = true;
        });
      } else {
        customSnackBar('Something went wrong, please try again!', false);
      }
    }).catchError((error) {
      print(error);
      error = error as DioError;
      ScaffoldMessenger.of(context)
          .showSnackBar(customSnackBar("Something went wrong!", false));
    }).timeout(const Duration(seconds: 10), onTimeout: () {
      ScaffoldMessenger.of(context).showSnackBar(
          customSnackBar('Connection timeout, please try again!', false));
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!getMatches) connectWithBackendLogin();
    final mediaQuery = MediaQuery.of(context);
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          // toolbarHeight: mediaQuery.size.height * 0.05,
          // bottomOpacity: 0.5,
          bottom: const TabBar(
              indicatorColor: Colors.amber,
              dividerColor: Colors.amber,
              labelPadding: EdgeInsets.all(0),
              padding: EdgeInsets.all(0),
              // indicatorPadding: EdgeInsets.all(5),
              // indicator: BoxDecoration(
              //   borderRadius: BorderRadius.all(Radius.circular(40)),
              //   color: Colors.white,
              // ),
              tabs: [
                Column(children: [
                  Icon(
                    Icons.home,
                    color: Colors.amber,
                  ),
                  Text(
                    'Home',
                    style: TextStyle(color: Colors.white70),
                  ),
                ]),
                Column(children: [
                  Icon(
                    Icons.sports_soccer,
                    color: Colors.amber,
                  ),
                  Text(
                    'Matches',
                    style: TextStyle(color: Colors.white70),
                  ),
                ]),
                Column(children: [
                  Icon(
                    Icons.person,
                    color: Colors.amber,
                  ),
                  Text(
                    'Profile',
                    style: TextStyle(color: Colors.white70),
                  ),
                ]),
              ]),
          actionsIconTheme: const IconThemeData(color: Colors.amber),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.more_vert),
            ),

            // circular avatar contains text to sign in
            role == noRole
                ? GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed(LogInScreen.routeName);
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 30),
                      // it should be rounded
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Theme.of(context).colorScheme.background,
                      ),
                      child: const Text(
                        'Log In',
                        style: TextStyle(
                            color: Colors.amber,
                            fontSize: 20,
                            fontFamily: 'RubikBubbles'),
                      ),
                    ),
                  )
                : CircleAvatar(
                    // backgroundImage: ,
                    backgroundColor: Colors.transparent,
                    child: Image.asset(
                      './assets/imgs/profile.jpg',
                      fit: BoxFit.fill,
                    ),
                  ),
          ],
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Row(mainAxisSize: MainAxisSize.min, children: [
            CircleAvatar(
              child: Image.asset(
                './assets/imgs/epl-logo.png',
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(MyHomePage.routeName);
              },
              child: const Text(
                'Reservo',
                style:
                    TextStyle(color: Colors.amber, fontFamily: 'RubikBubbles'),
              ),
            )
          ]),
          centerTitle: mediaQuery.size.width > 600,
        ),
        body: TabBarView(
          children: [
            homeTab(),
            matchesTab(),
            profileTab(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          tooltip: 'reserve your ticket now!',
          child: GestureDetector(
              child: const Icon(
            Icons.add,
          )),
        ),
      ),
    );
  }
}
