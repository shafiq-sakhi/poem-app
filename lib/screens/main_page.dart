import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:hafiz_akbari/constants.dart';
import '../repositories/database_connection.dart';
import 'drawer_navigation.dart';

// ignore: use_key_in_widget_constructors
class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex=0;

  @override
  void initState() {
    super.initState();
    DatabaseConnection().initDB();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      extendBody: true,
      endDrawer:  DrawerNavigation(),
      appBar: AppBar(
        centerTitle: true,
        title: Text(titles[_selectedIndex],
          style: const TextStyle(
              fontSize: 25.0
          ),
        ),
        backgroundColor: kMainColor.withOpacity(0.98),
      ),
      body: Container(
        constraints:const BoxConstraints.expand(),
        decoration: backgroundDecor,
        child: pages[_selectedIndex],
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
            iconTheme: const IconThemeData(color: kWhiteColor)
        ),
        child: CurvedNavigationBar(
            color:  kMainColor,
            height: 60.0,
            backgroundColor: Colors.transparent,
            items: items,
            index: _selectedIndex,
            onTap: (index)=> setState(() {
              _selectedIndex=index;
            }),
          ),
        ),
    );
  }

}


