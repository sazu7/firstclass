import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:myapps/bottom_nav_controller.dart';
import 'package:myapps/pages/chat.dart';
import 'package:myapps/second_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Box box = await Hive.openBox('contact-list');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          textTheme:
              GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme.apply()),
          brightness: Brightness.light,
          floatingActionButtonTheme: FloatingActionButtonThemeData(
              shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(50))))),
      routes: {
        '/first-screen': (context) => ChatScreen(),
        '/second-screen': (context) => SecondScreen(),
      },
      title: 'Flutter Demo',
      home: BottomNavController(),
    );
  }
}
