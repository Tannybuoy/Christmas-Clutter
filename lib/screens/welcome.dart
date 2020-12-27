import 'package:flutter/material.dart';
import 'package:xmasmusic/main.dart';
import 'package:xmasmusic/screens/home_screen.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage('assets/images/santa.jpg'),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Text(
              'Christmas Clutter',
              style: TextStyle(color: Colors.white, fontSize: 45),
            ),
            SizedBox(height: 25),
            Text(
              'Get ready for christmas',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            SizedBox(height: 50),
            GestureDetector(
              onTap: (){
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => HomeScreen()));
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 100, vertical: 18),
                decoration: BoxDecoration(
                    color: Colors.white, borderRadius: BorderRadius.circular(25)),
                child: Text(
                  'Get Started',
                  style: TextStyle(
                      color: kPrimaryBlue,
                      fontSize: 16,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
            SizedBox(height: 35),
          ],
        ),
      ),
    );
  }
}