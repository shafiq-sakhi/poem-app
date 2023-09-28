import 'package:flutter/material.dart';
import 'package:hafiz_akbari/components/section_button.dart';
import 'package:hafiz_akbari/constants.dart';
import 'package:hafiz_akbari/screens/sections/poem_section_ghazal.dart';

class PoemCollectionPage extends StatefulWidget {
  const PoemCollectionPage({Key? key}) : super(key: key);

  @override
  State<PoemCollectionPage> createState() => _PoemCollectionPageState();
}

class _PoemCollectionPageState extends State<PoemCollectionPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: paddingBy16,
        child: Column(
          children: [
             SectionButtons(
                 text: 'غزل',
                 onTap: (){
                   Navigator.of(context).push(MaterialPageRoute(
                       builder: (context) => PoemSectionOfGhazal()
                   )
                   );
                 },
             ),
            SectionButtons(
                text: 'قصیده',
                onTap: (){
                },
            ),
            SectionButtons(
                text: 'رباعیات',
                onTap: (){
                },
            )
            ],
          ),
   );
  }
}
