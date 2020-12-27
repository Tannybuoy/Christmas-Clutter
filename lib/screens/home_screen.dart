import 'package:flutter/material.dart';
import 'package:xmasmusic/widgets/destination_carousel.dart';
import 'package:xmasmusic/screens/wishlist.dart';
import 'package:xmasmusic/widgets/hotel_carousel.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:xmasmusic/main.dart';
import 'package:xmasmusic/screens/loading.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  int _currentTab = 0;
  List<IconData> _icons = [
    FontAwesomeIcons.gift,
    FontAwesomeIcons.music,
    FontAwesomeIcons.images,
    FontAwesomeIcons.video,
  ];
  Widget _buildIcon(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
          switch (_selectedIndex) {
            case 0:
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Loading()));
              break;

            case 1:
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => WishListPage()));
              break;
          }
        });
      },
      child: Container(
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
          color: _selectedIndex == index
              ? Theme.of(context).accentColor
              : Color(0xFFE7EBEE),
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Icon(
          _icons[index],
          size: 25.0,
          color: _selectedIndex == index
              ? Theme.of(context).primaryColor
              : Color(0xFFB4C1C4),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            HomeHeader(),
            Padding(
              padding: EdgeInsets.only(left: 80.0, right: 80.0),
              child: Text(
                'What would you like to find?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: kPrimaryBlue,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: _icons
                  .asMap()
                  .entries
                  .map(
                    (MapEntry map) => _buildIcon(map.key),
                  )
                  .toList(),
            ),
            SizedBox(height: 20.0),
            HotelCarousel(),
            SizedBox(height: 20.0),
            DestinationCarousel(),
          ],
        ),
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(canvasColor: kPrimaryBlue),
        child: BottomNavigationBar(
          currentIndex: _currentTab,
          onTap: (int value) {
            setState(() {
              _currentTab = value;
            });
          },
          iconSize: 30,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.list), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.card_giftcard), label: 'Wishlist'),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite_border), label: 'Favourite'),
            BottomNavigationBarItem(
                icon: Icon(Icons.mail_outline), label: 'Profile'),
          ],
        ),
      ),
    );
  }
}

class HomeHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 200),
      alignment: Alignment.bottomCenter,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/images/header.jpg'),
        ),
      ),
    );
  }
}
