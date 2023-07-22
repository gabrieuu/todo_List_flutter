import 'package:flutter/material.dart';
import 'package:test/models/task_items.dart';

class TaskProvider extends ChangeNotifier{


  List<TaskItems> listaItems = [];

    
  void cadastrar(TaskItems t){

  //buscar todos os elementos

    if(listaItems.isEmpty){

      t.setId(1);
      listaItems.add(t);
      notifyListeners();

    } else {

      TaskItems last = listaItems[listaItems.length-1];
      t.setId(last.getId()!+1);
      listaItems.add(t);
      notifyListeners();

    }

  }

  void remover(TaskItems t){
    listaItems.remove(t);
    notifyListeners();
  }


}