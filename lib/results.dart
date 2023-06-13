import 'package:buzz/buzz.dart';
import 'package:buzz/models/SpotifySongModel.dart';
import 'package:flutter/material.dart';

class Results extends StatefulWidget {
  const Results({super.key, required this.jsonData});
  final String jsonData;

  @override
  State<Results> createState() => _ResultsState();
}

class _ResultsState extends State<Results> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Text(widget.jsonData),
      ),
    );
  }
}
