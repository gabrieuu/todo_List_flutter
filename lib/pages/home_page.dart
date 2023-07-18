import 'package:flutter/material.dart';
import 'package:test/util/colors.dart';
import 'package:test/widgets/header.dart';
import 'package:test/widgets/tasks_box.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _body(),
      bottomNavigationBar: _bottomNav(),
    );
  }
  _appBar(){
    return PreferredSize(
      preferredSize: Size.fromHeight(0),
      child: AppBar(
        elevation: 0,
      ),
      );
  }
  _body(){
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: const Column(
          children: [
            Header(),
            Tasks(),          
          ],
        ),
      ),
    );
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