import 'package:flutter/material.dart';
import 'package:front_end_code/widgets/common_appbar.dart';

class LogInScreen extends StatefulWidget {
  static const routeName = '/login';
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  bool buildLogIn = true;
  Widget buildLoginLayout(double textScaleFactor, GlobalKey outerKey) {
    return Expanded(
        flex: 6,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('Welcome Back!',

                // it should be underlined

                style: TextStyle(
                    color: Colors.amber,
                    fontFamily: 'RubikBubbles',
                    fontSize: 35 * textScaleFactor)),

            // input text field
            TextField(
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'RubikBubbles',
                  fontSize: 20 * textScaleFactor),
              decoration: InputDecoration(
                hintText: 'Username',
                icon: Icon(Icons.person,
                    color: Colors.amber, size: 35 * textScaleFactor),
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
                    fontSize: 20 * textScaleFactor),
                // change the inserted text style
                counterStyle: const TextStyle(color: Colors.red),

                icon: Icon(
                  Icons.password,
                  color: Colors.amber,
                  size: 35 * textScaleFactor,
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  print(outerKey.currentContext!.size!.width);
                },
                child: Text(
                  'Forgot Password?',
                  style: TextStyle(
                      fontFamily: 'RubikBubbles',
                      color: Colors.amber,
                      fontSize: 14 * textScaleFactor),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                'Log In',
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'RubikBubbles',
                    fontSize: 20 * textScaleFactor),
              ),
            ),
          ],
        ));
  }

  Widget buildRegiesterLayout(double textScaleFactor) {
    return const Card(
      child: Center(child: Text('Hello')),
    );
  }

  Widget signUpRegisterLayout(double textScaleFactor) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () {
            setState(() {
              buildLogIn = true;
            });
          },
          child: Text(
            'Log In',
            style: TextStyle(
                color: Colors.amber,
                fontSize: 16 * textScaleFactor,
                fontFamily: 'RubikBubbles'),
          ),
        ),
        const Text('|', style: TextStyle(color: Colors.amber, fontSize: 20)),
        TextButton(
          onPressed: () {
            setState(() {
              buildLogIn = false;
            });
          },
          child: Text(
            'Register',
            style: TextStyle(
                color: Colors.amber,
                fontSize: 16 * textScaleFactor,
                fontFamily: 'RubikBubbles'),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final textScaleFactor = mediaQuery.textScaleFactor;
    final outerContainerKey = GlobalKey();
    bool minWidth = mediaQuery.size.width > 800;

    bool minHeight = mediaQuery.size.height < 400;

    return Scaffold(
      appBar: const CustomAppBar(title: 'EPL Reservo'),
      body: Container(
        key: outerContainerKey,
        width: mediaQuery.size.width,
        height: mediaQuery.size.height,
        decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('./assets/imgs/stadium_background.png'),
              fit: BoxFit.cover,
              opacity: 1.0,
            ),
            color: Colors.transparent),
        child: Align(
          alignment: const Alignment(0, -0.8),
          heightFactor: 0.5,
          widthFactor: 0.5,
          child: SizedBox(
            width:
                mediaQuery.size.width * (0.45 * (minWidth ? 1 : (.8 / 0.45))),
            height: mediaQuery.size.height * (0.45 * (!minHeight ? 1 : 2)),
            child: Card(
              elevation: 5,
              color: const Color.fromARGB(92, 255, 193, 7),
              child: minHeight
                  ? Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Increase the window height please!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.amber,
                            fontSize: 30 * textScaleFactor,
                            fontFamily: 'RubikBubbles'),
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          signUpRegisterLayout(textScaleFactor),
                          buildLogIn
                              ? buildLoginLayout(
                                  textScaleFactor, outerContainerKey)
                              : buildRegiesterLayout(textScaleFactor)
                        ],
                      ),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
