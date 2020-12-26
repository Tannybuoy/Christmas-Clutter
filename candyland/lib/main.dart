import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Color kPrimaryBlue = Color(0xff3c528b);
//Main function is starting point of all future Flutter apps
//Following tutorial https://www.youtube.com/watch?v=DIn-4nRfkUg
void main() {
  SystemChrome.setEnabledSystemUIOverlays([]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
        WishListPage(),
      ],
    );
  }
}

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
            image: AssetImage('images/santa.jpg'),
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
            Container(
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
            SizedBox(height: 35),
          ],
        ),
      ),
    );
  }
}

class WishListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          Header(),
          Padding(
            padding: EdgeInsets.fromLTRB(25, 25, 25, 15),
            child: Text(
              'Gift Lists',
              style: TextStyle(
                  color: kPrimaryBlue,
                  fontWeight: FontWeight.w700,
                  fontSize: 16),
            ),
          ),
          WishListGroup(
            name: 'Family',
            img: AssetImage('images/bear.png'),
          ),
          SizedBox(height: 15),
          WishListGroup(
            name: 'Friends',
            img: AssetImage('images/penguin.png'),
          ),
        ],
      ),
      bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(canvasColor: Colors.red.shade400),
          child: BottomNavigationBar(
              showSelectedLabels: false,
              iconSize: 30,
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.list), label: '1'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.card_giftcard), label: '2'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.favorite_border), label: '3'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.mail_outline), label: '4'),
              ])),
    );
  }
}

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 200),
      alignment: Alignment.bottomCenter,
      decoration: BoxDecoration(
          image: DecorationImage(
        fit: BoxFit.cover,
        image: AssetImage('images/header.jpg'),
      )),
      child: Column(
        children: <Widget>[
          Text(
            'Budget',
            style: TextStyle(
              color: kPrimaryBlue,
              fontWeight: FontWeight.w700,
              fontSize: 20,
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                '\$ 1280',
                style: TextStyle(
                  color: kPrimaryBlue,
                  fontWeight: FontWeight.w700,
                  fontSize: 40,
                ),
              ),
              Text(
                '\/ \$ 2000',
                style: TextStyle(
                  color: Colors.red.shade300,
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class WishListGroup extends StatefulWidget {
  final String name;
  final ImageProvider img;
  const WishListGroup({this.name, this.img});
  @override
  _WishListGroupState createState() => _WishListGroupState();
}

class _WishListGroupState extends State<WishListGroup> {
  bool vis = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        GestureDetector(
          onTap: () {
            setState(() {
              vis = !vis;
            });
          },
          child: Container(
            decoration: BoxDecoration(
              color: kPrimaryBlue,
              borderRadius: BorderRadius.circular(15),
            ),
            margin: EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              children: <Widget>[
                SizedBox(width: 25),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      widget.name,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 10),
                    Text(
                      '4 People',
                      style: TextStyle(color: Colors.white70),
                    ),
                  ],
                ),
                Spacer(),
                Container(
                  height: 100,
                  width: 100,
                ),
              ],
            ),
          ),
        ),
        Visibility(
          visible: vis,
          child: Container(
            padding: EdgeInsets.all(15),
            margin: EdgeInsets.symmetric(horizontal: 25),
            decoration: BoxDecoration(
                color: Color(0xfff3faff),
                borderRadius: BorderRadius.circular(15)),
            child: Column(
              children: <Widget>[
                WishListTile(
                  status: true,
                  name: 'Mom',
                  amount: 100,
                ),
                ListDivider(),
                WishListTile(
                  status: true,
                  name: 'Dad',
                  amount: 70,
                ),
                ListDivider(),
                WishListTile(
                  status: false,
                  name: 'Sister',
                  amount: 10,
                ),
                ListDivider(),
                WishListTile(
                  status: false,
                  name: 'Grandma',
                  amount: 0,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class WishListTile extends StatelessWidget {
  final String name;
  final bool status;
  final int amount;
  const WishListTile({this.name, this.status, this.amount});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Icon(
          status ? Icons.check_circle_outline : Icons.highlight_off,
          color: status ? Colors.green.shade400 : Colors.red.shade300,
        ),
        SizedBox(width: 10),
        Text(
          name,
          style: TextStyle(color: kPrimaryBlue, fontSize: 18),
        ),
        Spacer(),
        Text(
          '\$$amount\/',
          style: TextStyle(color: kPrimaryBlue, fontSize: 18),
        ),
        Text(
          '\$100',
          style: TextStyle(color: Colors.red.shade300, fontSize: 18),
        ),
      ],
    );
  }
}

class ListDivider extends StatelessWidget {
  const ListDivider({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      margin: EdgeInsets.symmetric(vertical: 10),
      color: Colors.blueGrey.shade100,
    );
  }
}
