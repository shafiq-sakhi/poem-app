
class Poem{
  int? id;
  late String content;
  late String poemName;
  late int fovorites;

  poemMapping(){
    var mapping=Map<String,dynamic>();
    mapping['id']=id;
    mapping['content']=content;
    mapping['poemName']=poemName;
    mapping['favorites']=fovorites;
    return mapping;
  }

}