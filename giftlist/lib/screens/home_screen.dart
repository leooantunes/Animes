import 'package:flutter/material.dart';
import 'package:giftlist/screens/list_screen.dart';
import 'package:giftlist/screens/search_screen.dart';
import 'package:gradient_bottom_navigation_bar/gradient_bottom_navigation_bar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController _pageController;
  int currentItem = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: GradientBottomNavigationBar(
        currentIndex: currentItem,
        onTap: (p) {
          _pageController.animateToPage(p,
              duration: Duration(milliseconds: 500), curve: Curves.ease);
        },
        backgroundColorStart: Color.fromRGBO(231, 40, 74, 1),
        backgroundColorEnd: Color.fromRGBO(253, 146, 30, 1),
        fixedColor: Colors.white,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.format_list_bulleted,
              size: 30,
              color: Colors.white,
            ),
            title: Text(
              "Minha Lista",
              style: TextStyle(fontSize: 25, color: Colors.white),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              size: 30,
              color: Colors.white,
            ),
            title: Text(
              "Procurar Anime",
              style: TextStyle(fontSize: 25, color: Colors.white),
            ),
          )
        ],
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (p) {
          setState(() {
            currentItem = p;
          });
        },
        children: <Widget>[
          ListPage(),
          HomeSearch()
        ],
      ),
    );
  }
}
