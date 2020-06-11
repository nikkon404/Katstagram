import 'package:flutter/material.dart';
import 'package:katstagram/pages/feed/feed_page.dart';
import 'package:katstagram/pages/profile/profile_page.dart';
import 'package:katstagram/utils/data.dart';

import 'activity.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var currentPageIndex = 0;

  List<Widget> pages = [
    FeedPage(),
    FeedPage(),
    FeedPage(),
    ActivityPage(),
    Profile(
      profileUser: getData().first.user,
      isDefaultUser: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentPageIndex],
      bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            setState(() {
              currentPageIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          currentIndex: currentPageIndex,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          iconSize: 28,
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: Colors.black,
                ),
                title: Text('')),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.search,
                  color: Colors.black,
                ),
                title: Text('')),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.add_circle_outline,
                  color: Colors.black,
                ),
                title: Text('')),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.favorite_border,
                  color: Colors.black,
                ),
                title: Text('')),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person_outline,
                  color: Colors.black,
                ),
                title: Text('')),
          ]),
    );
  }
}
