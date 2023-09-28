import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hafiz_akbari/constants.dart';

// ignore: camel_case_types
class SectionButtons extends StatelessWidget {
  final String text;
  final Function onTap;

  SectionButtons({required this.text,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Opacity(
          opacity: 0.7,
          child: Container(
            decoration:const  BoxDecoration(
                color: Colors.transparent,
                border: Border(
                   bottom: BorderSide(
                     width: 0.2,
                     color: Colors.grey
                   )
                )
            ),
            child: FlatButton(
              onPressed: ()=> onTap(),
              child: Center(
                child: Column(
                  children: [
                    Directionality(
                      textDirection: textDirection,
                      child: Text(
                        text,
                        style:const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w700
                        ),
                      ),
                    ),
                    sizedBox10,
                    Directionality(
                      textDirection: textDirection,
                      child: Text(
                        '(۳۰ مورد)',
                        style: TextStyle(
                            color: Colors.white.withOpacity(0.8),
                            fontSize: 15,
                            fontWeight: FontWeight.w700
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ),
          )
      ),
    );
  }
}