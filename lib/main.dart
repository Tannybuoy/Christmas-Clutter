import 'package:flutter/material.dart';
import 'package:xmasmusic/screens/home_screen.dart';
import 'package:xmasmusic/screens/wishlist.dart';
import 'package:xmasmusic/screens/welcome.dart';

Color kPrimaryBlue = Color(0xff3c528b);

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Christmas Clutter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xff3c528b),
        accentColor: Color(0xfff3faff),
        scaffoldBackgroundColor: Colors.white,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return PageView(
      children: <Widget>[
        WelcomePage(),
        HomeScreen(),
        WishListPage(),
      ],
    );
  }
}
