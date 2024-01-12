import 'package:flutter/material.dart';
import 'package:encrypted_shared_preferences/encrypted_shared_preferences.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'showCountry.dart';

// const String _baseURL = 'https://mariofinalproject.000webhostapp.com/';
const String _baseURL = 'http://10.0.2.2:8080/ToursProject';

class AddCountry extends StatefulWidget {
  const AddCountry({super.key});

  @override
  State<AddCountry> createState() => _AddCountryState();
}

class _AddCountryState extends State<AddCountry> {
  TextEditingController _controllerCid = TextEditingController();
  TextEditingController _controllerName = TextEditingController();
  TextEditingController _controllerImage = TextEditingController();

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
            // SizedBox(
            //   width: 200,
            //   child: TextField(
            //     controller: _controllerCid,
            //     keyboardType: TextInputType.number,
            //     decoration: InputDecoration(
            //         hintText: "Enter Country ID", border: OutlineInputBorder()),
            //   ),
            // ),
            // SizedBox(
            //   height: 20,
            // ),
            SizedBox(
              width: 200,
              child: TextField(
                controller: _controllerName,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    hintText: "Enter Country Name",
                    border: OutlineInputBorder()),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: 200,
              child: TextField(
                controller: _controllerImage,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    hintText: "Enter Image asset (images/)",
                    border: OutlineInputBorder(),
                    hintStyle: TextStyle(fontSize: 12)),
              ),
            ),
            SizedBox(height: 60),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    _loading = true;
                  });
                  saveCountry(
                    update,
                    // int.parse(_controllerId.text.toString()),
                    _controllerName.text.toString(),
                    // int.parse(_controllerAge.text.toString()),
                    _controllerImage.text.toString(),
                  );
                },
                child: Text(
                  "Add Country",
                  style: TextStyle(
                      color: Colors.green[900],
                      fontSize: 20,
                      fontWeight: FontWeight.w900),
                )),
            SizedBox(height: 30),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => ShowCountry()));
                  });
                },
                child: Text(
                  "Browse Countries",
                  style: TextStyle(
                      color: Colors.green[900],
                      fontSize: 20,
                      fontWeight: FontWeight.w900),
                ))
          ],
        ),
      ),
    );
  }
}

void saveCountry(
    Function(String text) update, String name, String image) async {
  try {
    // String myKey = await _encryptedData2.getString('myKey');
    // send a JSON object using http post
    final response = await http
        .post(Uri.parse('$_baseURL/addCountry.php'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            }, // convert the cid, name and key to a JSON object
            body: convert.jsonEncode(<String, String>{
              // 'id': '$id',
              'name': name,
              'image': '$image',
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
