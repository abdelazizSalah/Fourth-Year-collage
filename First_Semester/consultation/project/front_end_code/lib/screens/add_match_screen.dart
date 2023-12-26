import 'package:flutter/material.dart';
import 'package:front_end_code/widgets/common_appbar.dart';
import 'package:front_end_code/widgets/custom_snackbar.dart';

class AddMatchScreen extends StatefulWidget {
  const AddMatchScreen({super.key});
  static const routeName = "/add_create_screen";
  @override
  State<AddMatchScreen> createState() => _AddMatchScreenState();
}

class _AddMatchScreenState extends State<AddMatchScreen> {
  int selectedIdx = -1;
  final reservedSeats = {};
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      appBar: const CustomAppBar(title: "Reservo"),
      body: Container(
        width: mediaQuery.size.width,
        height: mediaQuery.size.height,
        decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('./assets/imgs/stadium_background.png'),
              fit: BoxFit.cover,
              opacity: 0.6,
            ),
            color: Colors.transparent),
        child: ListView(
          children: const [
            Center(
                child: Text(
              "Create a match!",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  fontFamily: "RubikBubbles",
                  color: Colors.amber),
            )),
            TextField()
          ],
        ),
      ),
    );
  }
}
