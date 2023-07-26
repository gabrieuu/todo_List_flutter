import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test/controller/task_controller.dart';
import 'package:test/models/task_items.dart';
import 'package:test/util/colors.dart';

class Tasks extends StatefulWidget {
  final TaskItems task;
  const Tasks({Key? key, required this.task}) : super (key: key);

  @override
  State<Tasks> createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  
  late TaskProvider taskProvider;

  @override
  Widget build(BuildContext context) {

    TaskItems task  = widget.task;
    taskProvider = Provider.of<TaskProvider>(context);

    return Card(
      color: secoundColor,
      child: Padding(
        padding: const EdgeInsets.all(10),
        
        child: Column(
          children: [
            _title(title: task.title, importance: task.importance ),
          
            _description(description: task.description),
          
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                Text(task.complete ? "Completed" : "Pending", style: TextStyle(fontSize: 9, fontWeight: FontWeight.bold, color: task.complete ? sucess : critical),),
                _icons(task),
              ],
            )
          ]
          ),
      ),
    );
  }

  //margin: const EdgeInsets.only(top: 10),
  //padding: const EdgeInsets.all(10),

  _title({required String title, required String importance}){
    return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title,style: const TextStyle(fontWeight: FontWeight.w500),),
              Text(importance.toUpperCase(), style: TextStyle(fontSize: 9, color: _importanceColor(importance.toLowerCase()), fontWeight: FontWeight.bold),) 
            ],
          );
  }
  Color _importanceColor(String importance){
    if(importance == "low"){
      return sucess;
    }
    else if(importance == "medium"){
      return warning;
    }
    else if(importance == "high"){
      return danger;
    }
    else{
      return critical;
    }
  }
  _description({required String description}){
    return Container(
            width: 300,
            margin: const EdgeInsets.symmetric(vertical: 10),
            constraints: const BoxConstraints(
              maxWidth: 400
            ),
            child: Text(description,style: const TextStyle(fontSize: 9,fontWeight: FontWeight.w600),)
            );
  }
  
  _icons(TaskItems task){
    return Wrap(
               direction: Axis.horizontal,
                children: [

                  IconButton(
                    splashRadius: 15,           
                             
                    onPressed: (){
                      setState(() {
                        task.completar();
                      });
                    }, 
                    icon: task.complete ? const Icon(Icons.cancel_outlined, size: 20,) : const Icon(Icons.check, size: 18,),
                    
                  ),
                  //Icone de finalizado

                   IconButton(
                    splashRadius: 15,
                    onPressed: (){}, 
                    icon: const Icon(Icons.edit, size: 18,)
                  ),//icone de editar

                   IconButton(
                    splashRadius: 15,
                    onPressed: (){
                      setState(() {
                        
                        showDialog(
                          context: context, 
                          builder: (context) => AlertDialog(
                            title: const Text("Remover", textAlign: TextAlign.center,style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                            content: Text("Essa ação não poderá ser desfeita!", textAlign: TextAlign.center, style: TextStyle(fontSize: 11, color: critical),),
                            actions: [
                              Center(
                                child: Wrap(
                                  spacing: 5,
                                  runSpacing: 5,
                                  alignment: WrapAlignment.center,
                                  children: [
                              
                                  ElevatedButton(
                                  onPressed: (){
                                    Navigator.pop(context);
                                  }, 
                                  style: ButtonStyle(
                                    backgroundColor: const MaterialStatePropertyAll(Colors.white),
                                    foregroundColor: MaterialStatePropertyAll(orange),
                                    side: MaterialStatePropertyAll(BorderSide(color: orange)),
                                    
                                  ),
                                  child: const Text("Cancelar")
                                  ),
                                
                                 ElevatedButton(
                                   onPressed: (){
                                     taskProvider.remover(task);
                                     Navigator.pop(context);
                                   }, 
                                   style: ButtonStyle(
                                     backgroundColor: MaterialStatePropertyAll(orange)
                                   ),
                                   child: const Text("Confirmar")
                                 ),
                              
                                  ],
                                ),
                              )
                                
                            ],
                          ),);
                          
                          //taskProvider.remover(task);           
                      });
                    }, 
                    icon: const Icon(Icons.delete, size: 18,)
                  ),// icone de deletar
                  
                  
                ],
              );
  }
}

