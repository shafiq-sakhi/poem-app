
import 'package:hafiz_akbari/repositories/repository.dart';

class PoemServices{
  late Repository _repository;

  PoemServices(){
    _repository=Repository();
  }

  readPoem()async{
    return await _repository.readData('ghazalPoems');
  }

  readPoemWithCondition(condition)async{
    return await _repository.readDataWithCondition('ghazalPoems', condition);
  }

  updatePoemFavorite(value,id)async{
    return await _repository.updateDataRaw('ghazalPoems', 'favorites=$value', id);
  }

  searchPoem(keyword)async{
    return await _repository.searchForData('ghazalPoems', keyword);
  }

}