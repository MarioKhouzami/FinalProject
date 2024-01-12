import 'package:flutter/material.dart';
import 'tours.dart';
import 'addCountry.dart';
import 'addEvent.dart';

class pageThree extends StatefulWidget {
  const pageThree({super.key});

  @override
  State<pageThree> createState() => _pageThreeState();
}

class _pageThreeState extends State<pageThree> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.lightGreenAccent,
        appBar: AppBar(title: Text("Insert New Data"),backgroundColor: Colors.lightGreenAccent,),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // SizedBox(height: 20),
              Text("Add A country" , style: TextStyle(color: Colors.green[900], fontWeight: FontWeight.bold, fontSize: 30),),
              SizedBox(height: 40),
              ElevatedButton(
                  onPressed: (){
                    setState(() {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder:(context)=>AddCountry(),
                      ));
                    });
                  },
                  child: Text("Click Here!" , style: TextStyle(color: Colors.green[900],fontSize: 30,fontWeight: FontWeight.w900)),
              ),
              SizedBox(height: 60),
              Text("Add An Event To The Available Countries",style: TextStyle(color: Colors.green[900], fontWeight: FontWeight.bold, fontSize: 22 , )),
              SizedBox(height: 40,),
              ElevatedButton(
                  onPressed: (){
                    setState(() {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder:(context)=>AddEvent(),
                      ));
                    });
                  },
                  child: Text("Click Here!",style: TextStyle(color: Colors.green[900],fontSize: 30,fontWeight: FontWeight.w900)),
              ),],

          ),
        ),
    );
  }
}
