import 'package:flutter/material.dart';
import 'package:test/models/task_items.dart';
import 'package:test/util/colors.dart';

class ShowModal extends StatefulWidget {
  final String title;
  final String description;
  final String priority;

  const ShowModal({super.key, this.title = '', this.description = '', this.priority = ''});

  @override
  State<ShowModal> createState() => _ShowModalState();
}

class _ShowModalState extends State<ShowModal> {
  
  String dropValue = '';

  List<String> dropdown = [
    "low",
    "medium",
    "high",
    "critical"
  ];
  
  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Wrap(
          runSpacing: 20,
          children: [
            const Center(
              child: Text("Add Task", style: TextStyle(fontWeight: FontWeight.bold),),
            ),
            _txtField(label: "Title"),
            _txtField(label: "Description"),
            _dropdown(),
            Row(
              
              children: [
                Expanded(child: _buttonBack(txt: "CANCEL", cor: backgroundColor),),
                SizedBox(width: 10,),
                Expanded(child: _buttonAdd(txt: "ADD", cor: Colors.orange),)
              ],
            )
            
            
          ],
          )
      ),
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
            value: (dropValue.isEmpty) ? null : dropValue,
            onChanged: (resposta){
              setState(() {
                dropValue = resposta.toString();
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
  _buttonBack({String txt = '', Color cor = Colors.black}){
      return ElevatedButton(
              onPressed: (){
                Navigator.pop(context);
              }, 
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.white),
                foregroundColor: MaterialStatePropertyAll(Color.fromRGBO(250, 130, 76, 1)),
                side: MaterialStatePropertyAll(BorderSide(color: Color.fromRGBO(250, 130, 76, 1)))
              ),
              child: Text(txt),
            );
  }
  _buttonAdd({String txt = '', Color cor = Colors.black}){
      return ElevatedButton(
              onPressed: (){}, 
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Color.fromRGBO(250, 130, 76, 1))
              ),
              child: Text(txt),
            );
  }
  _txtField({String label = ''}){
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
              ),
      ],
    );
  }
}