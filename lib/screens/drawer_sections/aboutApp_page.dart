import 'package:flutter/material.dart';
import 'package:hafiz_akbari/constants.dart';

class AboutAppPage extends StatefulWidget {
  const AboutAppPage({Key? key}) : super(key: key);

  @override
  State<AboutAppPage> createState() => _AboutAppPageState();
}

class _AboutAppPageState extends State<AboutAppPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
            'درباره برنامه'
        ),
        backgroundColor: kMainColor.withOpacity(0.98),
      ),
      body: Container(
        constraints:const BoxConstraints.expand(),
        decoration: backgroundDecor,
        child: Column(
          children: [

          ],
        ),
      ),
    );
  }
}
