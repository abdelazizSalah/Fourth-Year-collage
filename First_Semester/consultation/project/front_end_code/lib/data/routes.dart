import 'package:front_end_code/screens/add_match_screen.dart';
import 'package:front_end_code/screens/approve_requests_screen.dart';
import 'package:front_end_code/screens/home_page_screen.dart';
import 'package:front_end_code/screens/login_screen.dart';
import 'package:front_end_code/screens/reserve_a_seat_screen.dart';

final routes = {
  LogInScreen.routeName: (ctx) => const LogInScreen(),
  MyHomePage.routeName: (ctx) => const MyHomePage(title: 'EPL Reservo'),
  ResearveASeatScreen.routeName: (ctx) => const ResearveASeatScreen(),
  AddMatchScreen.routeName: (ctx) => const AddMatchScreen(),
  AllRequestsScreen.routeName: (ctx) => const AllRequestsScreen(),
};
