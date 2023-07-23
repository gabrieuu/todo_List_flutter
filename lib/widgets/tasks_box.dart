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

    return Container(

      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.all(10),

      decoration: BoxDecoration(
        color: secoundColor,
        borderRadius: BorderRadius.circular(5)
      ),
      
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
    );
  }

  _title({required String title, required String importance}){
    return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title,style: const TextStyle(fontWeight: FontWeight.w400),),
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
                    onPressed: (){
                      setState(() {
                        task.completar();
                      });
                    }, 
                    icon: const Icon(Icons.check, size: 18,),
                    
                  ),
                  //Icone de finalizado

                   IconButton(
                    onPressed: (){}, 
                    icon: const Icon(Icons.edit, size: 18,)
                  ),//icone de editar

                   IconButton(
                    onPressed: (){
                      setState(() {
                          taskProvider.remover(task);           
                      });
                    }, 
                    icon: const Icon(Icons.delete, size: 18,)
                  ),// icone de deletar
                  
                  
                ],
              );
  }
}

