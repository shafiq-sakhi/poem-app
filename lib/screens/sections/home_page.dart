import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hafiz_akbari/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{
  late AnimationController controller;

  @override
  void initState(){
    super.initState();
    controller=AnimationController(
        duration: Duration(milliseconds: 800),
        vsync: this,
        upperBound: 100.0
    );
    controller.forward();

    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 210,
                child: Stack(
                    children: [
                       Positioned(
                         top: 100,
                         left: 55,
                         child: Container(
                           height: 90.0,
                           width: 250.0,
                           decoration: BoxDecoration(
                               border: Border.all(
                                   color: kWhiteColor.withOpacity(0.5),
                                   width: 0.6
                               ),
                               borderRadius: cirRadiusBy5
                           ),
                         ),
                       ),
                       const Positioned(
                         top: 120,
                         left: 70,
                         child: Text(
                          'شعــــــــــــــــــر روز',
                          style: TextStyle(
                              fontSize: 40.0,
                              color: kWhiteColor,
                              fontWeight: FontWeight.bold
                          ),
                      ),
                       ),
                      Positioned(
                        top: 31,
                        left: 135,
                        child: Container(
                          height: controller.value+50.0,
                          width: controller.value,
                          child: const Image(
                              image: AssetImage('images/bird.png')
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                       Text(
                        'سه شنبه‌، ۲۰ حمل، ۱۴۰۱',
                        style: TextStyle(
                            fontSize:20.0,
                            color: kWhiteColor.withOpacity(0.6)
                        ),
                      ),
                      sizedBox5,
                      IconButton(
                          onPressed: (){},
                          icon: const Icon(
                            Icons.refresh_rounded,
                            size: 40.0,
                            color: kWhiteColor,
                          )
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: paddingBy8,
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Text(
                      'خلق اطفالند جز مست خدا\nنیست بالغ جز رهیده از هوا',
                      style: TextStyle(
                          fontSize:23,
                          color: kWhiteColor.withOpacity(0.8),
                          wordSpacing: 3.5,
                          letterSpacing: 2.5
                      ),
                    ),
                  ),
                ),
            ],
        );
  }
}
