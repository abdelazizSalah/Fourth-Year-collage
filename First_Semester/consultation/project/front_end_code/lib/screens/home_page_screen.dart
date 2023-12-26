import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:front_end_code/networks/constant_end_points.dart';
import 'package:front_end_code/screens/login_screen.dart';
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
    return Container(
      color: Colors.black87,
      child: ListView(
        children: [
          Expanded(
            child: SizedBox(
              height: 150,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 100,
                itemBuilder: (context, index) {
                  return Container(
                      color: const Color.fromARGB(174, 255, 193, 7),
                      child: const MatchWidget());
                },
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisExtent: 300,
                crossAxisSpacing: 5,
                childAspectRatio: 1,
              ),
              itemCount: 100,
              itemBuilder: (context, index) {
                return Container(
                    color: Color.fromARGB(127, 223, 194, 1),
                    child: const NewsWidet());
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget profileTab() {
    return Container(
      color: Colors.black87,
    );
  }

  Widget matchesTab() {
    return Container(
      color: Colors.black87,
    );
  }

  @override
  Widget build(BuildContext context) {
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
