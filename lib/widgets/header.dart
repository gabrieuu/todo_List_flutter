import 'package:flutter/material.dart';
import 'package:test/util/colors.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 5, top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Wrap(
            direction: Axis.vertical,
            spacing: 1,
            crossAxisAlignment: WrapCrossAlignment.start,
             children: [
              Text("Task List",style: TextStyle(fontSize: 14, color: black, fontWeight: FontWeight.bold),),
              const Text("Add, delete ou mark as done a task",style: TextStyle(fontSize: 10),)
             ],
          ),
          const Column(
            children: [
              Icon(Icons.add_circle_outline,size: 19,),
              Text("ADD", style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),)
            ],
          )
        ],
      ),
    );
  }
}