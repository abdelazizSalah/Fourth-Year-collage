import 'package:flutter/material.dart';

class TopTabs extends StatefulWidget {
  const TopTabs({super.key});

  @override
  State<TopTabs> createState() => _TopTabsState();
}

class _TopTabsState extends State<TopTabs> {
  Widget buildLoginLayout(double textScaleFactor) {
    return SizedBox(
      child: Column(children: [
        Expanded(
            flex: 4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Welcome Back!',

                    // it should be underlined

                    style: TextStyle(
                        color: Colors.amber,
                        fontFamily: 'RubikBubbles',
                        fontSize: 40 * textScaleFactor)),

                // input text field
                TextField(
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'RubikBubbles',
                      fontSize: 22 * textScaleFactor),
                  decoration: InputDecoration(
                    hintText: 'Username',
                    icon: Icon(Icons.person,
                        color: Colors.amber, size: 40 * textScaleFactor),
                    hintStyle: const TextStyle(
                        color: Colors.black, fontFamily: 'RubikBubbles'),
                  ),
                ),
                TextField(
                  obscureText: true,
                  style: const TextStyle(
                      color: Colors.black, fontFamily: 'RubikBubbles'),
                  decoration: InputDecoration(
                    hintText: 'Password',
                    hintStyle: TextStyle(
                        color: Colors.black,
                        fontFamily: 'RubikBubbles',
                        fontSize: 22 * textScaleFactor),
                    // change the inserted text style
                    counterStyle: const TextStyle(color: Colors.red),

                    icon: Icon(
                      Icons.password,
                      color: Colors.amber,
                      size: 40 * textScaleFactor,
                    ),
                  ),
                ),
              ],
            ))
      ]),
    );
  }

  Widget buildRegiesterLayout(double textScaleFactor) {
    return Card(
      child: Center(child: Text('Hello')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
              bottom: TabBar(
                tabs: [
                  Tab(
                    text: 'Login',
                  ),
                  Tab(
                    text: 'Register',
                  ),
                ],
              ),
              title: Text('Login'),
            ),
            body: TabBarView(
              children: [
                buildLoginLayout(MediaQuery.of(context).textScaleFactor),
                buildRegiesterLayout(MediaQuery.of(context).textScaleFactor),
              ],
            )));
  }
}
