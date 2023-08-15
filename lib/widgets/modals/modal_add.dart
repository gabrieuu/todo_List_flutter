

import 'package:flutter/material.dart';
import 'package:test/models/task_items.dart';
import 'package:test/util/colors.dart';

class ShowModal extends StatefulWidget {
  
  TaskItems? task;
  ShowModal({super.key, this.task});

  @override
  State<ShowModal> createState() => _ShowModalState(task: task);
}

class _ShowModalState extends State<ShowModal> {
  
  TaskItems? task;
  _ShowModalState({this.task});

   
  String dropValue = '';
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();
  String priority = "";
  String? msgErro;

  List<String> dropdown = [
    "low",
    "medium",
    "high",
    "critical"
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if(task != null){
      title.text = task!.title;
      description.text = task!.description;
      dropValue = task!.importance;
    }


  }

  @override
  Widget build(BuildContext context) {
    
    return  Container(
      padding: const EdgeInsets.all(15),
      child: SingleChildScrollView(
        child: Wrap(
          runSpacing: 10,
          children: [
            const Center(
              child: Text("Add Task", style: TextStyle(fontWeight: FontWeight.bold),),
            ),
            _txtFieldTitle(label: "Title"),
            _txtFieldDesc(label: "Description"),
            _dropdown(),
            Center(child: Text(msgErro ?? "", style: TextStyle(color: critical),)),
            Row(
              
              children: [
                Expanded(child: _buttonBack(txt: "CANCEL", cor: backgroundColor),),
                const SizedBox(width: 10,),
                Expanded(child: _buttonAdd(txt: "ADD", cor: Colors.orange),)
              ],
            ),
            
            
          ],
          ),
      )
    );
  }
  _dropdown(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,    
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 10),
          child: const Text("Priority", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13)
          )),
        DropdownButton<String>(
            hint: const Text("Selecione"),
            value: dropValue.isNotEmpty ? dropValue : null,
            onChanged: (resposta){
              setState(() {
                dropValue = resposta!;
              });
            },
            items: dropdown.map((drop) => DropdownMenuItem(
              value: drop,
              child: Text(drop),

              )).toList(),
            underline: Container(),
            
            isExpanded: true,
            borderRadius: BorderRadius.circular(10),
            focusColor: backgroundColor,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            style: TextStyle(fontSize: 12, color: black),
            
            
          ),
      ],
    );
  }  
  _txtFieldTitle({String label = ''}){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 10),
          child: Text(label, style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 13),
          )),
        TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  hintText: label,
                  labelStyle: const TextStyle(fontSize: 12),
                  floatingLabelStyle: const TextStyle(color: Colors.red),
                  floatingLabelAlignment: FloatingLabelAlignment.start,
                ),
                controller: title,
              ),
      ],
    );
  }
  _txtFieldDesc({String label = '',}){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 10),
          child: Text(label, style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 13),
          )),
        TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  hintText: label,
                  labelStyle: const TextStyle(fontSize: 12),
                  floatingLabelStyle: const TextStyle(color: Colors.red),
                  floatingLabelAlignment: FloatingLabelAlignment.start,
                ),
                controller: description,
              ),
      ],
    );
  }
  _buttonBack({String txt = '', Color cor = Colors.black}){
      return ElevatedButton(
              onPressed: (){
                Navigator.pop(context);
              }, 
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.white),
                foregroundColor: MaterialStatePropertyAll(orange),
                side: MaterialStatePropertyAll(BorderSide(color: orange))
              ),
              child: Text(txt),
            );
  }
  _buttonAdd({String txt = '', Color cor = Colors.black}){
    msgErro = null;
      return ElevatedButton(
              onPressed: (){     
                                      
                  TaskItems task = TaskItems(title: title.text, description: description.text, importance: dropValue);
                  Navigator.of(context).pop(task); 
                          
              }, 
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(orange)
              ),
              child: Text(txt),
            );
  }
}