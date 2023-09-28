import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';
import 'package:hafiz_akbari/constants.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  int _selected=0;
  Color pickerColor=kWhiteColor;
  double sliderValue=0.5;

  Widget buildColorPicker()=>MaterialColorPicker(
      selectedColor: pickerColor,
      onColorChange: (color)=> setState(() {
        pickerColor=color;
      })
  );

  void changeColor(BuildContext context)=> showDialog(
      context: context,
      builder: (context)=>AlertDialog(
        content: Column(
          children: [
            buildColorPicker(),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child:const Text(
                'SELECT',
                style: TextStyle(
                    fontSize: 20.0
                ),
              ),
            ),
          ],
        ),
      )
  );

  List<Widget> makeRadio(){
    List<Widget> list=<Widget>[];
    List<String> names=['کوچک','متوسط','برجسته'];
    List<FontWeight> fontWeight=[FontWeight.w200,FontWeight.w500,FontWeight.w800];
    for(int i = 0; i<3; i++){
     list.add(Row(
       mainAxisAlignment: MainAxisAlignment.end,
       children: [
         Directionality(
           textDirection: TextDirection.rtl,
           child: Text(
             names[i],
             style: TextStyle(
                 fontSize: 18.0,
                 color: kWhiteColor.withOpacity(0.7),
                 fontWeight: fontWeight[i]
             ),
           ),
         ),
         Radio(
           fillColor: MaterialStateColor.resolveWith((states) => kWhiteColor.withOpacity(0.8)),
           value: i,
           onChanged: null,
           groupValue: _selected,
         ),
       ],
     ));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'تنظیمات برنامه'
        ),
        backgroundColor: kMainColor.withOpacity(0.98),
      ),
      body: Container(
        constraints:const BoxConstraints.expand(),
        decoration: backgroundDecor,
        child: Padding(
          padding: paddingBy16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Text(
                'اندازه نمایش قلم اشعار',
                style: TextStyle(
                  fontSize: 20.0,
                  color: kWhiteColor
                ),
              ),
              Column(
                children: makeRadio(),
              ),
              Divider(
                thickness: 0.8,
                color: kWhiteColor.withOpacity(0.4),
              ),
              const Padding(
                padding:  EdgeInsets.only(right: 15.0,bottom: 15.0,top: 5.0),
                child:  Text(
                  'رنگ خطوط اشعار',
                  style: TextStyle(
                      fontSize: 20.0,
                      color: kWhiteColor
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15.0,bottom: 10.0),
                child: GestureDetector(
                  onTap: ()=> changeColor(context),
                  child: Container(
                    height: 55.0,
                    width: 200.0,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: kWhiteColor.withOpacity(0.5),
                            width: 0.6
                        ),
                        borderRadius: cirRadiusBy5
                    ),
                    child: Padding(
                      padding: paddingBy5,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: cirRadiusBy5,
                            color: pickerColor
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Divider(
                thickness: 0.8,
                color: kWhiteColor.withOpacity(0.4),
              ),
              const Padding(
                padding:  EdgeInsets.only(top: 8.0,bottom: 10),
                child: Text(
                  'فاصله بین حروف اشعار',
                  style: TextStyle(
                      fontSize: 20.0,
                      color: kWhiteColor
                  ),
                ),
              ),
              Slider(
                activeColor: kWhiteColor,
                inactiveColor: kWhiteColor.withOpacity(0.5),
                onChanged: (value){},
                value: sliderValue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}