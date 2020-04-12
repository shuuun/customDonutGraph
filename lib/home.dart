import 'package:flutter/material.dart';
import 'donutGraph.dart';
import 'dart:math';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final _percentage = ValueNotifier<double>(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Donut Graph')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _percentage.value = Random().nextInt(100).toDouble();
        },
        child: Icon(Icons.refresh),
      ),
      body: Center(
        child: ValueListenableBuilder(
          valueListenable: _percentage,
          builder: (context, per, child) {
            return DonutGraph(percentage: per, trackColor: Colors.grey[300], completedColor: Colors.cyan,);    
          },
        )
      ),
    );
  }
}
