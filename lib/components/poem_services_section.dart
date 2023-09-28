import 'package:flutter/material.dart';
import 'package:hafiz_akbari/constants.dart';

class PoemServicesSection extends StatelessWidget {
  final IconData icon;
  final Function onPressed;

  PoemServicesSection({required this.icon,required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42.0,
      width: 42.0,
      decoration: BoxDecoration(
          borderRadius: cirRadiusBy5,
          color: kWhiteColor.withOpacity(0.3)
      ),
      child: InkWell(
        child: Icon(
          icon,
          color: kWhiteColor,
          size: 32.0,
        ),
        onTap: ()=> onPressed(),
      ),
    );
  }
}
