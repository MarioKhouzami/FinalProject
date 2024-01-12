import 'package:flutter/material.dart';
import 'package:encrypted_shared_preferences/encrypted_shared_preferences.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'tours.dart';
// const String _baseURL = 'https://mariofinalproject.000webhostapp.com/';
const String _baseURL = 'http://10.0.2.2:8080/ToursProject';

class AddEvent extends StatefulWidget {
  const AddEvent({super.key});

  @override
  State<AddEvent> createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
  // TextEditingController _controlleriId = TextEditingController();
  TextEditingController _controllerTitle = TextEditingController();
  TextEditingController _controllerDate = TextEditingController();
  TextEditingController _controllerPrice = TextEditingController();
  TextEditingController _controllerCid = TextEditingController();

  bool _loading = false;

  void update(String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
    setState(() {
      _loading = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreenAccent,
      appBar: AppBar(
        title: Text("Add A country"),
        backgroundColor: Colors.lightGreenAccent,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 30),
            SizedBox(
              width: 200,
              child: TextField(
                controller: _controllerTitle,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    hintText: "Enter Event Title", border: OutlineInputBorder()),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 200,
              child: TextField(
                controller: _controllerDate,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: "Enter Event Date",
                    border: OutlineInputBorder()),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: 200,
              child: TextField(
                controller: _controllerPrice,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: "Enter Price",
                    border: OutlineInputBorder(),
                    ),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: 200,
              child: TextField(
                controller: _controllerCid,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "Enter Country",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 60),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    _loading = true;
                  });
                  saveEvent(
                    update,
                    _controllerTitle.text.toString(),
                    _controllerDate.text.toString(),
                    double.parse(_controllerPrice.text.toString()),
                    int.parse(_controllerCid.text.toString()),
                  );
                },
                child: Text(
                  "Add Event",
                  style: TextStyle(
                      color: Colors.green[900],
                      fontSize: 20,
                      fontWeight: FontWeight.w900),
                )),
            // SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
void saveEvent(
    Function(String text) update, String title, String date, double price, int Cid) async {
  try {
    // String myKey = await _encryptedData2.getString('myKey');
    // send a JSON object using http post
    final response = await http
        .post(Uri.parse('$_baseURL/addEvent.php'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        }, // convert the cid, name and key to a JSON object
        body: convert.jsonEncode(<String, String>{
          // 'id': '$id',
          'title': title,
          'date': date,
          'price': '$price',
          'Cid': '$Cid',
          // 'key': "admin_key"
        }))
        .timeout(const Duration(seconds: 5));
    if (response.statusCode == 200) {
      // if successful, call the update function
      update(response.body);
    }
  } catch (e) {
    update("connection error");
  }
}