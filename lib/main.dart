import 'package:flutter/material.dart';
import 'package:hafiz_akbari/screens/drawer_sections/aboutApp_page.dart';
import 'package:hafiz_akbari/screens/drawer_sections/setting_page.dart';
import 'package:hafiz_akbari/screens/main_page.dart';
import 'package:persian_fonts/persian_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  late ScaffoldState scaffoldState;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: PersianFonts.vazirTextTheme
      ),
      home: MainPage(),

      routes: {
         '/SettingPage': (context) => SettingPage(),
         '/AboutAppPage': (context) => AboutAppPage()
      },

    );
  }

}




