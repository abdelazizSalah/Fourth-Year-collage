import 'package:flutter/material.dart';
import 'package:front_end_code/widgets/common_appbar.dart';
import 'package:front_end_code/widgets/request_widget.dart';

class AllRequestsScreen extends StatefulWidget {
  const AllRequestsScreen({super.key});
  static const routeName = "/all_requests_screen";

  @override
  State<AllRequestsScreen> createState() => _AllRequestsScreenState();
}

class _AllRequestsScreenState extends State<AllRequestsScreen> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
        appBar: CustomAppBar(title: "Reservo"),
        body: Container(
            height: mediaQuery.size.height,
            width: mediaQuery.size.width,
            decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('./assets/imgs/stadium_background.png'),
                  fit: BoxFit.cover,
                  opacity: 1.0,
                ),
                color: Colors.transparent),
            child: ListView.builder(
              itemCount: 6,
              itemBuilder: (ctx, idx) {
                // return Text("Hello$idx");
                return Dismissible(
                    direction: DismissDirection.endToStart,
                    background: Container(
                      margin: const EdgeInsets.only(right: 10),
                      color: Colors.red,
                      child: const Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("Reject",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  fontFamily: "RubikBubbles",
                                  color: Colors.amber)),
                        ),
                      ),
                    ),
                    key: UniqueKey(),
                    child: const RequestWidget());
              },
            )));
  }
}
