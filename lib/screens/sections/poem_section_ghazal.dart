import 'package:flutter/material.dart';
import 'package:hafiz_akbari/components/poem_section_button.dart';
import 'package:hafiz_akbari/constants.dart';
import 'package:hafiz_akbari/models/poem_model.dart';
import 'package:hafiz_akbari/screens/sections/poem_sectionOfSection.dart';
import 'package:hafiz_akbari/services/poem_services.dart';

class PoemSectionOfGhazal extends StatefulWidget {
  const PoemSectionOfGhazal({Key? key}) : super(key: key);

  @override
  State<PoemSectionOfGhazal> createState() => _PoemSectionOfGhazalState();
}

class _PoemSectionOfGhazalState extends State<PoemSectionOfGhazal> {
  late List<Poem> _poemLists;
  var poemService=PoemServices();
  late List<String> lines;
  late List<String> poemFirstLine;

  getPoem()async{
    _poemLists=<Poem>[];
    var poem= await poemService.readPoem();
    poem.forEach((poem){
      setState(() {
        var poemModel=Poem();
        poemModel.id=poem['id'];
        poemModel.content=poem['content'];
        poemModel.poemName=poem['poemName'];
        poemModel.fovorites=poem['favorites'];
        _poemLists.add(poemModel);
      });
    });
  }

  getPoemLines(int index,int startIndex){
    String text= _poemLists[index].content;
    lines=<String>[];

    List<String> poemLines=text.split('؟');

    for(int i=startIndex; i<poemLines.length; i+=2){
      lines.add(poemLines[i]);
    }

    return  lines;
  }

  @override
  void initState() {
    super.initState();
    getPoem();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: kMainColor.withOpacity(0.98),
        title:const Text(
          'غزل',
        ),
      ),
      body: Container(
        decoration: backgroundDecor,
        child: Padding(
          padding: EdgeInsets.only(top: 5,bottom: 5),
          child: ListView.builder(
            itemCount: _poemLists.length,
            itemBuilder: (context,index) {
              return PoemSectionButton(
                child: setDistichAmount('('+numberMap[getPoemLines(index, 0).length].toString()+' ردیف'+')'),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          PoemSectionOfSection(
                            title: _poemLists[index].poemName,
                            firstLinesPoem: getPoemLines(index, 0),
                            secondLinesPoem: getPoemLines(index, 1),
                            isFavor: _poemLists[index].fovorites,
                            poemId: _poemLists[index].id,
                          )
                  )
                  );
                },
                hemistich: getPoemLines(index, 0)[0],
                text: _poemLists[index].poemName,
              );
            }
          ),
        ),
      ),
    );
  }

  setDistichAmount(String distichAmount){
    return Directionality(
      textDirection: textDirection,
      child: Text(
        distichAmount,
        style: TextStyle(
            color: Colors.white.withOpacity(0.8),
            fontSize: 15,
            fontWeight: FontWeight.w700
        ),
      ),
    );
  }

}


