import 'package:flutter/material.dart';
import 'package:test/models/task_items.dart';

class TaskProvider extends ChangeNotifier{


  List<TaskItems> listaItems = [];

    
  void cadastrar({required TaskItems task, int? index}){

    (index != null) ? listaItems[index] = task : listaItems.add(task);  
    
    notifyListeners();
 
  }

  void remover(TaskItems t){
    listaItems.remove(t);
    notifyListeners();
  }


}