import 'package:flutter/material.dart';
import 'tours.dart';
import 'pagetwo.dart';
import 'pagethree.dart';

class firstPage extends StatefulWidget {
  const firstPage({super.key});

  @override
  State<firstPage> createState() => _firstPageState();
}

class _firstPageState extends State<firstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreenAccent,
      appBar: AppBar(
        backgroundColor: Colors.lightGreenAccent,
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  updateTours();
                });
              },
              icon: Icon(Icons.refresh_sharp)),
          IconButton(
              onPressed: () {
                setState(() {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder:(context)=>pageThree()));
                });
              },
              icon: Icon(Icons.add)),
        ],
      ),
      body: ShowTours(),
    );
  }
}
