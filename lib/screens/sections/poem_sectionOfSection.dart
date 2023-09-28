import 'package:flutter/material.dart';
import 'package:hafiz_akbari/components/poem_services_section.dart';
import 'package:hafiz_akbari/constants.dart';
import 'package:hafiz_akbari/services/poem_services.dart';

class PoemSectionOfSection extends StatefulWidget {
  final title;
  final firstLinesPoem;
  final secondLinesPoem;
  var isFavor;
  final poemId;
  PoemSectionOfSection({this.title,this.firstLinesPoem,this.secondLinesPoem,this.isFavor,this.poemId});

  @override
  State<PoemSectionOfSection> createState() => _PoemSectionOfSectionState();
}

class _PoemSectionOfSectionState extends State<PoemSectionOfSection> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: kMainColor.withOpacity(0.98),
        title: Text(
          widget.title,
        ),
      ),
      body: Container(
        constraints:const BoxConstraints.expand(),
        decoration: backgroundDecor,
        child: Column(
          children: [
            Container(
              height: 50.0,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: kMainColor.withOpacity(0.6),
                border: const Border(
                  bottom: BorderSide(
                      width: 0.2,
                      color: Colors.grey
                  )
                )
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PoemServicesSection(
                      icon: Icons.copy,
                      onPressed: (){}
                  ),
                  const SizedBox(
                    width: 5.0,
                  ),
                  PoemServicesSection(
                      icon: Icons.share,
                      onPressed: (){}
                  ),
                  const SizedBox(
                    width: 5.0,
                  ),
                  PoemServicesSection(
                      icon: widget.isFavor==0 ? Icons.favorite_border : Icons.favorite,
                      onPressed: (){
                        PoemServices service=PoemServices();
                        service.updatePoemFavorite(widget.isFavor==0 ? 1 : 0, widget.poemId);
                        setState(() {
                          widget.isFavor==0 ? widget.isFavor=1 : widget.isFavor=0;
                        });
                      }
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: widget.firstLinesPoem.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: paddingBy8,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Directionality(
                                textDirection: textDirection,
                                child: Text(
                                  widget.firstLinesPoem[index],
                                  style: poemTextStyle,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Directionality(
                                textDirection: TextDirection.rtl,
                                child: Text(
                                  widget.secondLinesPoem[index],
                                  style: poemTextStyle,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  }
              ),
            ),
          ],
        ),
      ),
    );
  }
}
