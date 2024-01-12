import 'package:flutter/material.dart';
import 'tours.dart';
import 'pageone.dart';
import 'Home.dart';
class pageTwo extends StatefulWidget {
  const pageTwo({super.key});

  @override
  State<pageTwo> createState() => _pageTwoState();
}

class _pageTwoState extends State<pageTwo> {
  @override
  Widget build(BuildContext context) {
    Tour tour = ModalRoute.of(context)!.settings.arguments as Tour;

    return Scaffold(
      backgroundColor: Colors.lightGreenAccent,
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(tour.location,
                style: TextStyle(fontWeight: FontWeight.bold,
                    fontSize: 50,color: Colors.green[900])
            ),
            SizedBox(height: 30,),


            // SizedBox(height: 25,),

            Text("Info: ${tours.toString()}",
                style: TextStyle(fontWeight: FontWeight.bold,
                    fontSize: 20,color: Colors.green[700])),


            SizedBox(height: 50),

            TextButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.lightGreen),
                    padding: MaterialStatePropertyAll(EdgeInsets.only(left: 30, right: 30,top: 15,bottom: 15))
                ),

                onPressed: (){
                  Navigator.of(context).pop();
                },
                child: Text("Back to see all the tours", style: TextStyle(color: Colors.green[800], fontSize: 25),)
            ),
          ],
        ),
      ),
    );
  }
}
