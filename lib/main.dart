import 'package:flutter/material.dart';
import 'donutGraph.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.cyan
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final _percentage = ValueNotifier<double>(15);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('chart example')),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _percentage.value = Random().nextInt(100).toDouble(),
        child: Icon(Icons.refresh),
      ),
      body: Center(
        child: ValueListenableBuilder(
          valueListenable: _percentage, 
          builder: (context, per, child) {
            return DonutGraph(percentage: per, trackColor: Colors.grey[300], completedColor: Colors.green,);
          })
      ),
    );
  }
}
