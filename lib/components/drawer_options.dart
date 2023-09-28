import 'package:flutter/material.dart';
import 'package:hafiz_akbari/constants.dart';

class DrawerOptions extends StatelessWidget {
  final String text;
  final IconData icon;
  final Function onPressed;
  final double size;

  DrawerOptions({required this.text,required this.icon,required this.onPressed,required this.size});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>onPressed(),
      child: Padding(
          padding: const EdgeInsets.only(bottom: 10.0,right: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                text,
                style:const TextStyle(
                    color: kFontColor,
                    fontSize: 20.0,
                )
              ),
              SizedBox(
                width: size,
              ),
              Icon(
                icon,
                size: 40.0,
                color:const Color(0xffa6a6a6),
              ),
            ],
          ),
      ),
    );
  }
}
