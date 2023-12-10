import 'package:flutter/material.dart';
import 'package:front_end_code/widgets/common_appbar.dart';

class LogInScreen extends StatefulWidget {
  static const routeName = '/login';
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  bool buildLogIn = false;
  Widget buildLoginLayout(double textScaleFactor) {
    return Expanded(
        flex: 5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // margin: const EdgeInsets.only(top: 10),
            Text('Welcome Back!',

                // it should be underlined

                style: TextStyle(
                    color: Colors.amber,
                    fontFamily: 'RubikBubbles',
                    fontSize: 35 * textScaleFactor)),

            // input text field
            Container(
              margin: const EdgeInsets.all(10),
              child: TextField(
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
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 5),
              child: TextField(
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
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: Text(
                  'Forgot Password?',
                  style: TextStyle(
                      fontFamily: 'RubikBubbles',
                      color: Colors.amber,
                      fontSize: 14 * textScaleFactor),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: ElevatedButton(
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
            ),
          ],
        ));
  }

  final newMemberData = [
    [
      ' userName',
      Icons.person,
    ], // must be unique], // must be unique
    [
      ' password',
      Icons.password,
    ], // must be unique],
    [
      ' email',
      Icons.email,
    ], // must be unique],
    [
      ' firstName',
      Icons.abc,
    ], // must be unique],
    [
      ' lastName',
      Icons.abc_rounded,
    ], // must be unique],
    [
      ' birthDate',
      Icons.date_range,
    ], // must be unique],
    // [
    //   ' gender',
    //   Icons.male,
    // ], // must be unique],
    [
      ' city',
      Icons.cabin,
    ], // must be unique],
    [
      ' adress',
      Icons.cabin_rounded,
    ], // must be unique],
    // [
    //   ' role',
    //   Icons.radar_sharp,
    // ], // must be unique], // manager / fan
  ];
  Widget buildDropBox(bool horizontal, double textScaleFactor) {
    if (horizontal) {
      return Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Wrap(children: [
              Icon(Icons.male, color: Colors.amber, size: 35 * textScaleFactor),
              Padding(
                padding: const EdgeInsets.all(0.0),
                child: DropdownButton<String>(
                  value: gender,
                  dropdownColor: Colors.amber,
                  icon: const Icon(Icons.no_sim_rounded),
                  iconSize: 0,
                  elevation: 16,
                  alignment: Alignment.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'RubikBubbles',
                      fontSize: 20 * textScaleFactor),
                  underline: Container(
                    height: 2,
                    color: Colors.amber,
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      gender = newValue!;
                    });
                  },
                  items: ['Male', 'Female']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ]),
          ),
          // drop down menu for the role
          Expanded(
            child: Wrap(
              children: [
                Icon(Icons.workspace_premium_rounded,
                    color: Colors.amber, size: 35 * textScaleFactor),
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: DropdownButton<String>(
                    value: role,
                    dropdownColor: Colors.amber,
                    icon: const Icon(Icons.no_sim_rounded),
                    iconSize: 0,
                    elevation: 16,
                    alignment: Alignment.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'RubikBubbles',
                        fontSize: 20 * textScaleFactor),
                    underline: Container(
                      height: 2,
                      color: Colors.amber,
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        role = newValue!;
                      });
                    },
                    items: ['Fan', 'Manager']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          )
        ],
      );
    } else {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            child: Row(children: [
              Icon(Icons.male, color: Colors.amber, size: 35 * textScaleFactor),
              SizedBox(
                width: 100,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButton<String>(
                    value: gender,
                    dropdownColor: Colors.amber,
                    icon: const Icon(Icons.no_sim_rounded),
                    iconSize: 0,
                    elevation: 16,
                    alignment: Alignment.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'RubikBubbles',
                        fontSize: 20 * textScaleFactor),
                    underline: Container(
                      height: 2,
                      color: Colors.amber,
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        gender = newValue!;
                      });
                    },
                    items: ['Male', 'Female']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ]),
          ),
          // drop down menu for the role
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Icon(Icons.workspace_premium_rounded,
                  color: Colors.amber, size: 35 * textScaleFactor),
              SizedBox(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButton<String>(
                    value: role,
                    dropdownColor: Colors.amber,
                    icon: const Icon(Icons.no_sim_rounded),
                    iconSize: 0,
                    elevation: 16,
                    alignment: Alignment.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'RubikBubbles',
                        fontSize: 20 * textScaleFactor),
                    underline: Container(
                      height: 2,
                      color: Colors.amber,
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        role = newValue!;
                      });
                    },
                    items: ['Fan', 'Manager']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ],
          )
        ],
      );
    }
  }

  String gender = 'Male';
  String role = 'Fan';
  Widget buildRegiesterLayout(double textScaleFactor, bool horizontal) {
    return ListView(
      shrinkWrap: true,
      children: [
        Text('Welcome to EPL Reservo!',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.amber,
                fontFamily: 'RubikBubbles',
                fontSize: 28 * textScaleFactor)),

        ...newMemberData
            .map((element) => SizedBox(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                        obscureText: element[0] == ' password',
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'RubikBubbles',
                            fontSize: 20 * textScaleFactor),
                        decoration: InputDecoration(
                          icon: Icon(element[1] as IconData,
                              color: Colors.amber, size: 35 * textScaleFactor),
                          hintText: element[0] as String,
                          hintStyle: TextStyle(
                              color: Colors.black87,
                              fontFamily: 'RubikBubbles',
                              fontSize: 20 * textScaleFactor),
                          // change the inserted text style
                          counterStyle: const TextStyle(color: Colors.red),
                        )),
                  ),
                ))
            .toList(),

        // drop down menu for gender
        buildDropBox(horizontal, textScaleFactor)
      ],
    );
  }

  Widget topButtonsLayout(double textScaleFactor) {
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
    bool minWidth = mediaQuery.size.width > 700;

    bool minHeight = mediaQuery.size.height < 600;

    return Scaffold(
      appBar: const CustomAppBar(title: 'EPL Reservo'),
      body: Container(
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
          heightFactor: 1,
          widthFactor: 0.5,
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
                    child: SizedBox(
                      width: mediaQuery.size.width *
                          (0.3 * (minWidth ? 1 : (.9 / 0.45))),
                      height: !buildLogIn
                          ? mediaQuery.size.height
                          : mediaQuery.size.height *
                              (0.4 * (!minHeight ? 1 : 2)),
                      child: ListView(
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        // mainAxisSize: MainAxisSize.min,
                        // itemExtent: 50,

                        children: [
                          topButtonsLayout(textScaleFactor),
                          buildLogIn
                              ? buildLoginLayout(textScaleFactor)
                              : buildRegiesterLayout(textScaleFactor, minWidth)
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
