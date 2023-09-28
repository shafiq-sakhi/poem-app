
class Note{
 int? id;
 late String taskName;
 late String taskDate;

 noteMapping(){
  var mapping= Map<String,dynamic>();
  mapping['id']=id;
  mapping['task_name'] =taskName;
  mapping['task_date']=taskDate;

  return mapping;
 }

}