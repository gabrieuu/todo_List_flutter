import 'package:flutter/material.dart';
import 'package:test/util/colors.dart';

class Tasks extends StatefulWidget {
  const Tasks({super.key});

  @override
  State<Tasks> createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: secoundColor,
        borderRadius: BorderRadius.circular(5)
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Ir a Academia",style: TextStyle(fontWeight: FontWeight.bold),),
              Text("HIGH", style: TextStyle(fontSize: 9, color: danger, fontWeight: FontWeight.bold),) 
            ],
          ),
          Container(
            width: 300,
            margin: const EdgeInsets.symmetric(vertical: 10),
            constraints: const BoxConstraints(
              maxWidth: 400
            ),
            child: const Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed aliquet lectus vitae eleifend vestibulum. Vestibulum vitae faucibus libero.",style: TextStyle(fontSize: 9),)
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Pending", style: TextStyle(fontSize: 9, fontWeight: FontWeight.bold, color: danger),),
              const Wrap(
                direction: Axis.horizontal,
                spacing: 8,
                children: [
                  Icon(Icons.check, size: 18,),
                  Icon(Icons.edit,size: 18,),
                  Icon(Icons.delete,size: 18,)
                ],
              )
            ],
          )
        ]
        ),
    );
  }
}