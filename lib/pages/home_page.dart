import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test/controller/task_controller.dart';
import 'package:test/models/task_items.dart';
import 'package:test/util/colors.dart';
import 'package:test/widgets/modals/modal_add.dart';
import 'package:test/widgets/tasks_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late TaskProvider task;

  @override
  Widget build(BuildContext context) {   
    task = Provider.of<TaskProvider>(context); //recebe os valores de TaskProvider
    return Scaffold(
      appBar: _appBar(context),
      body: _body(),
      bottomNavigationBar: _bottomNav(),
    );
  }

  _appBar(BuildContext context){
    
    return AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Task List", style: TextStyle(color: black, fontSize: 16),),
            Text("Add, delete or mark as done a task",style: TextStyle(color: black, fontSize: 10),)
          ],
        ),
        elevation: 0.6,
        backgroundColor: Colors.white,
        actions: [
          TextButton(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.add_circle_outline,color: black,),
                Text("ADD",style: TextStyle(color: black, fontSize: 11),)
              ],
            ),
            onPressed: () async{
              TaskItems? lista = await showModalBottomSheet<TaskItems>(
                context: context,                
                builder: (context) => ShowModal());   
                
              if(lista != null){
                  setState(() {
                   task.cadastrar(task: lista);
                  });
              }
                

              },
              
            ),
        ]
      );
  }

 _body() {   

    if (task.listaItems.isEmpty) {
      return const Center(
        child: Text("vazio"),
      );
    } else {
      return Padding(       
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          
          itemCount: task.listaItems.length,
          itemBuilder: (context, index) => Tasks(task: task.listaItems[index], index: index,),         
        ),
      );
    }
  }

  

  _bottomNav(){
    return Container(
      height: 70,
      padding: const EdgeInsets.only(top: 10),
      alignment: Alignment.topCenter,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            color: Color.fromRGBO(0, 0, 0, 0.2),
          )
        ],
      ),

      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(Icons.task),
          Icon(Icons.notifications_outlined)
        ],
      ),
    );
  }
}