import 'package:flutter/material.dart';
import 'package:front_end_code/screens/login_screen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  static final routeName = '/home_page';
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
          GestureDetector(
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
                ),
              ),
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
          Text(
            widget.title,
            style: const TextStyle(
                color: Colors.amber, fontFamily: 'RubikBubbles'),
          )
        ]),
        centerTitle: true,
      ),
      body: const Center(
        child: Card(
          elevation: 30,
          shadowColor: Color.fromARGB(57, 255, 193, 7),
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
                'Welcome to EPL Reservo, Here You can enjoy the best experience with our fantastic league\n Order Your Ticket NOW!'),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'reserve your ticket now!',
        child: GestureDetector(
            child: const Icon(
          Icons.add,
        )),
      ),
    );
  }
}
