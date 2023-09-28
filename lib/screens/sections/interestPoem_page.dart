import 'package:flutter/material.dart';
import 'package:hafiz_akbari/components/poem_section_button.dart';
import 'package:hafiz_akbari/constants.dart';
import 'package:hafiz_akbari/models/poem_model.dart';
import 'package:hafiz_akbari/screens/sections/poem_sectionOfSection.dart';
import 'package:hafiz_akbari/services/poem_services.dart';

class InterestPoemPage extends StatefulWidget {
  const InterestPoemPage({Key? key}) : super(key: key);

  @override
  State<InterestPoemPage> createState() => _InterestPoemPageState();
}

class _InterestPoemPageState extends State<InterestPoemPage> {
  late List<Poem> _poemLists;
  var poemService=PoemServices();
  late List<String> lines;
  late List<String> poemFirstLine;

  getPoem()async{
    _poemLists=<Poem>[];
    var poem= await poemService.readPoemWithCondition('favorites=1');
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
  initState(){
    super.initState();
    getPoem();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: paddingBy5,
      child: ListView.builder(
        itemCount: _poemLists.length,
        itemBuilder: (context, index) {
          return PoemSectionButton(
              text: _poemLists[index].poemName,
              child: setDeleteIcon(
                  (){}
              ),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => PoemSectionOfSection(
                      title: _poemLists[index].poemName,
                      firstLinesPoem: getPoemLines(index,0),
                      secondLinesPoem: getPoemLines(index,1),
                      isFavor: _poemLists[index].fovorites,
                      poemId: _poemLists[index].id,
                    )
                )
                );
              },
              hemistich: getPoemLines(index, 0)[0]
          );
        })
    );
  }

  setDeleteIcon(Function onPressed){
    return IconButton(
      icon:const Icon(
        Icons.delete,
        size: 30.0,
        color: kWhiteColor,
      ),
      onPressed: ()=> onPressed(),
    );
  }

}
