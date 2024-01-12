import 'package:flutter/material.dart';
import 'pageone.dart';
import 'tours.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreenAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Welcome to a journey that you'll never forget!",
              style: TextStyle(color: Colors.green[600],
                  fontSize: 17,
                  fontWeight: FontWeight.w700),
            ),
            SizedBox(height: 40),
            Text("LebTours", style: TextStyle(fontWeight: FontWeight.bold,
                fontSize: 55,
                color: Colors.green[900]),),
            SizedBox(height: 40,),
            Text("Discover Lebanon, One Journey At A Time!", style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 17,
                color: Colors.green[600])),
            SizedBox(height: 20),
            Text(
              "`Journey into the unknown, explore the extraordinary, and let every step become a story as you embark on the adventure of a lifetime through the landscapes of possibility.`",
              style:TextStyle(fontStyle: FontStyle.italic, fontSize: 18,fontWeight:FontWeight.w600, color: Colors.green[700] ), textAlign: TextAlign.center,),
            SizedBox(height: 50),
            ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.lime),
                ),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const firstPage(),
                  ));
                },
                child: Text("Go Ahead!",
                  style: TextStyle(fontSize: 20, color: Colors.green[900]),))

          ],
        ),
      ),
    );
  }
}
