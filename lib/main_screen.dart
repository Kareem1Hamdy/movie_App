import 'package:flutter/material.dart';
import 'package:movie_app/Browse%20Screen/browse_screen.dart';
import 'package:movie_app/Search%20Screen/search_screen.dart';
import 'package:movie_app/WatchList%20Screen/watchlist_screen.dart';
import 'package:movie_app/provider/app_provider.dart';
import 'package:provider/provider.dart';
import 'Home Screen/home_screen.dart';

class MainScreen extends StatelessWidget {
   MainScreen({super.key});
  List<Widget> ScreensList=[
    HomeScreen(),
    SearchScreen(),
    BrowseScreen(),
    WatchListScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<AppProvider>(context);
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: provider.currentIndex,
        onTap: (index){
          provider.changeItemOnBottomNavBar(index);
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: 'HOME',backgroundColor: Color(0xff1A1A1A)),
          BottomNavigationBarItem(icon: Icon(Icons.search),label: 'SEARCH',backgroundColor: Color(0xff1A1A1A)),
          BottomNavigationBarItem(icon: Icon(Icons.movie),label: 'BROWSE',backgroundColor: Color(0xff1A1A1A)),
          BottomNavigationBarItem(icon: Icon(Icons.favorite),label: 'WATCHLIST',backgroundColor: Color(0xff1A1A1A)),
        ],
        selectedItemColor:const Color(0xffFFA90A),
        showUnselectedLabels: true,
      ),
      body: ScreensList[provider.currentIndex],
    );
  }
}
