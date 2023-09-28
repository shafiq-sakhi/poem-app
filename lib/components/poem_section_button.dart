import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hafiz_akbari/constants.dart';

// ignore: camel_case_types
class PoemSectionButton extends StatelessWidget {
  final String text;
  final String hemistich;
  final Function onTap;
  final Widget child;

  PoemSectionButton({required this.text,required this.child,required this.onTap,required this.hemistich});

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
                child: Directionality(
                  textDirection: textDirection,
                    child: ListTile(
                      title: Text(
                        text,
                        style:const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w700
                        ),
                      ),
                      subtitle: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            hemistich,
                            style: TextStyle(
                                color: Colors.white.withOpacity(0.8),
                                fontSize: 15,
                                fontWeight: FontWeight.w700
                            ),
                          ),
                          child
                        ],
                      ),
                    )
                )
            ),
          )
      ),
    );
  }
}