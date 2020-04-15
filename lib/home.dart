import 'package:flutter/material.dart';
import 'donutGraph.dart';
import 'dart:math';
import 'dart:ui';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {

  AnimationController _controller;
  final percentage = ValueNotifier<double>(0.0);
  double randomPercentage = 0.0;


  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(seconds: 1))
      ..addListener(() { 
        percentage.value = lerpDouble(0, randomPercentage, _controller.value);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Donut Graph')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            randomPercentage = Random().nextInt(100).toDouble();
            _controller.forward(from: 0.0);
          });
        },
        child: Icon(Icons.refresh),
      ),
      body: Center(
        child: ValueListenableBuilder(
          valueListenable: percentage, 
          builder: (context, per, child) {
            return DonutGraph(percentage: per, trackColor: Colors.grey[300], completedColor: Colors.cyan,);
          }
        )
      ),
    );
  }
}
