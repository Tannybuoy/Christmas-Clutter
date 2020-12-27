import 'package:flutter/material.dart';
import 'package:xmasmusic/main.dart';
import 'package:xmasmusic/widgets/snow-animation.dart';
import 'package:xmasmusic/screens/wishlist.dart';
import 'dart:async';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> with SingleTickerProviderStateMixin {
  bool _isRunning = true;

  @override
  void initState() {
    super.initState();
  }

  //anim
  @override
  Widget build(BuildContext context) {
    Timer(
      Duration(seconds: 6),
      () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (BuildContext context) => WishListPage()),
      ),
    );
    return Scaffold(
      body: Stack(
        children: [
          Container(
              color: Colors.white,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height),
          Container(
            child: SnowWidget(
              isRunning: _isRunning,
              totalSnow: 150,
              speed: 1,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Loading your WishList',
                  style: TextStyle(color: kPrimaryBlue, fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20.0),
                Text(
                  'Did You Know?\"Jingle Bells\" was written for Thanksgiving, not Christmas.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: kPrimaryBlue, fontSize: 18),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
