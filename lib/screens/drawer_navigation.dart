import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hafiz_akbari/components/drawer_options.dart';
import 'package:hafiz_akbari/constants.dart';

class DrawerNavigation extends StatelessWidget {
  const DrawerNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Opacity(
        opacity: 0.9,
        child: Padding(
          padding: const EdgeInsets.only(top: 80.0,bottom: 230.0,left: 140.0),
          child: Drawer(
            backgroundColor: const Color(0xff113455),
            child: Column(
              children:  [
                sizedBox10,
                DrawerOptions(
                  text: 'تنظیمات',
                  icon: Icons.settings,
                  onPressed: (){
                    Navigator.pushNamed(context, '/SettingPage');
                  },
                  size:24.0,
                ),
                sizedBox5,
                DrawerOptions(
                  text: 'معرفی به دوستان',
                  icon: Icons.group,
                  onPressed: (){},
                  size: 21.0,
                ),
                sizedBox5,
                DrawerOptions(
                  text: 'امتیاز به برنانه',
                  icon: Icons.star,
                  onPressed: (){},
                  size: 0,
                ),
                sizedBox5,
                DrawerOptions(
                  text: 'درباره برنانه',
                  icon: Icons.info,
                  onPressed: (){
                    Navigator.pushNamed(context, '/AboutAppPage');
                  },
                  size: 10.0,
                ),
                sizedBox5,
                DrawerOptions(
                  text: 'خروج',
                  icon: FontAwesomeIcons.powerOff,
                  onPressed: (){
                    SystemNavigator.pop();
                  },
                  size: 30.0,
                )
              ],
            ),
          ),
        ),
    );
  }
}
