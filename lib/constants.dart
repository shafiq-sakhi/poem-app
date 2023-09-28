import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hafiz_akbari/screens/sections/bio_page.dart';
import 'package:hafiz_akbari/screens/sections/home_page.dart';
import 'package:hafiz_akbari/screens/sections/interestPoem_page.dart';
import 'package:hafiz_akbari/screens/sections/note_page.dart';
import 'package:hafiz_akbari/screens/sections/poemCollection_page.dart';
import 'package:hafiz_akbari/screens/sections/search_page.dart';

const Color kMainColor=Color(0xff0f2f4c);
const Color kWhiteColor=Colors.white;
const Color kButtonColor=Color(0xff1d5b95);
const Color kFontColor=Color(0xffa6a6a6);

final List<String> titles=[
  'حافظ اکبری',
  'گنجینه اشعار',
  'جستجو',
  'مورد علاقه',
  'یادداشت ها',
  'زندگینامه'
];

final pages=[
  const HomePage(),
  const PoemCollectionPage(),
  const SearchPage(),
  const InterestPoemPage(),
  const NotePage(),
  const BioPage()
];

final items=[
  const Icon(Icons.home,size: 30),
  const Icon(FontAwesomeIcons.book,size: 25),
  const Icon(Icons.search,size: 30),
  const Icon(FontAwesomeIcons.heart,size: 25),
  const Icon(Icons.note_add_outlined,size: 30),
  const Icon(FontAwesomeIcons.user,size: 25),
];

const SizedBox sizedBox5=SizedBox(height: 5,);
const SizedBox sizedBox10=SizedBox(height: 10,);
const SizedBox sizedBox20=SizedBox(height: 20,);
const SizedBox sizedBox30=SizedBox(height: 30,);
const SizedBox sizedBox40=SizedBox(height: 40,);
const SizedBox sizedBox80=SizedBox(height: 80,);

 BorderRadius cirRadiusBy8= BorderRadius.circular(8.0);
 BorderRadius cirRadiusBy10= BorderRadius.circular(10.0);
 BorderRadius cirRadiusBy15= BorderRadius.circular(15.0);
 BorderRadius cirRadiusBy5= BorderRadius.circular(5.0);
 BorderRadius cirRadiusBy50= BorderRadius.circular(50.0);

const paddingBy10  = EdgeInsets.all(10);
const paddingBy8  = EdgeInsets.all(8);
const paddingBy16  = EdgeInsets.all(16);
const paddingBy20  = EdgeInsets.all(20);
const paddingBy5 = EdgeInsets.all(5);

TextStyle poemTextStyle=TextStyle(
    fontSize:18,
    color: kWhiteColor.withOpacity(0.8),
    wordSpacing: 2.5,
    letterSpacing: 0
);

const BoxDecoration backgroundDecor=BoxDecoration(
    image: DecorationImage(
        image: AssetImage('images/bg.jpg'),
        fit: BoxFit.cover
    )
);

const TextDirection textDirection=TextDirection.rtl;

const numberMap={0:'۰',1:'۱',2:'۲',3:'۳',4:'۴',5:'۵',6:'۶',7:'۷',8:'۸',9:'۹',};
