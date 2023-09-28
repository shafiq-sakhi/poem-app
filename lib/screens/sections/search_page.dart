import 'package:flutter/material.dart';
import 'package:hafiz_akbari/components/poem_section_button.dart';
import 'package:hafiz_akbari/constants.dart';
import 'package:hafiz_akbari/models/poem_model.dart';
import 'package:hafiz_akbari/screens/sections/poem_sectionOfSection.dart';
import 'package:hafiz_akbari/services/poem_services.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Poem> _poemLists=<Poem>[];
  var poemService=PoemServices();
  late List<String> lines;
  late List<String> poemFirstLine;

  getPoem(keyword)async{
    var poem= await poemService.searchPoem(keyword);
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
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: paddingBy10,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                  onPressed: (){
                  },
                  icon:const Icon(
                    Icons.search,
                    size: 45,
                    color: kWhiteColor,
                  )
              ),
              SizedBox(width: 10),
              Container(
                width: 280,
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: TextField(
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                      color: kWhiteColor.withOpacity(0.7)
                    ),
                    decoration: InputDecoration(
                      labelText: 'متن مورد نظر را وارد کنید: ',
                      labelStyle:  TextStyle(
                        color: kWhiteColor.withOpacity(0.6),
                        fontSize: 15.0
                      ),
                      border:  OutlineInputBorder(
                        borderRadius: cirRadiusBy8
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: cirRadiusBy8,
                        borderSide: BorderSide(
                          color: kWhiteColor.withOpacity(0.5)
                        )
                      ),
                      focusedBorder:  OutlineInputBorder(
                         borderRadius: cirRadiusBy8,
                         borderSide: const BorderSide(
                            color: Color(0xff1d5b95),
                          )
                      )
                    ),
                    onSubmitted: (newValue){
                      getPoem(newValue);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
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
        )
      ],
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
