import 'package:flutter/material.dart';
import 'package:front_end_code/widgets/common_appbar.dart';
import 'package:front_end_code/widgets/custom_snackbar.dart';

class ResearveASeatScreen extends StatefulWidget {
  const ResearveASeatScreen({super.key});
  static const routeName = "/researve_a_seat_screen";
  @override
  State<ResearveASeatScreen> createState() => _ResearveASeatScreenState();
}

class _ResearveASeatScreenState extends State<ResearveASeatScreen> {
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
        child: Center(
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: mediaQuery.size.width > 900
                  ? 10
                  : mediaQuery.size.width > 500
                      ? 6
                      : 3,
              mainAxisExtent: mediaQuery.size.width > 1200
                  ? mediaQuery.size.width * 0.13
                  : mediaQuery.size.width > 900
                      ? mediaQuery.size.width * 0.3
                      : mediaQuery.size.width * 0.4,
              crossAxisSpacing: 1,
              childAspectRatio: 1,
            ),
            itemCount: 33,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  print("Reserve This Seat number $index!");
                  setState(() {
                    selectedIdx = index;
                  });
                },
                onDoubleTap: () {
                  if (!reservedSeats.containsKey(selectedIdx)) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        customSnackBar("Seat is reserved successfuly", true));
                    setState(() {
                      reservedSeats[selectedIdx] = true;
                      print(reservedSeats);
                    });
                  }
                },
                child: Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.all(10),
                    alignment: Alignment.center,
                    color: reservedSeats.containsKey(index)
                        ? const Color.fromARGB(48, 244, 67, 54)
                        : selectedIdx == index
                            ? Colors.blue
                            : const Color.fromARGB(127, 223, 194, 1),
                    child: Text(
                      (index + 1).toString(),
                      style: TextStyle(
                          // fontWeight: FontWeight.bold,
                          fontSize: 24,
                          decoration: reservedSeats.containsKey(index)
                              ? TextDecoration.lineThrough
                              : null,
                          fontFamily: "RubikBubbles",
                          color: Colors.white),
                    )),
              );
            },
          ),
        ),
      ),
    );
  }
}
