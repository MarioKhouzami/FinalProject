import 'package:flutter/material.dart';
import 'tours.dart';
import 'package:encrypted_shared_preferences/encrypted_shared_preferences.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

// const String _baseURL = 'https://mariofinalproject.000webhostapp.com/';
const String _baseURL = 'http://10.0.2.2:8080/ToursProject';

List<String> _country = [];

void updateCountry() async {
  try {
    final url = Uri.parse('$_baseURL/getCountry.php');
    final response = await http.get(url).timeout(Duration(seconds: 5));
    _country.clear();
    if (response.statusCode == 200) {
      final jsonResponse = convert.jsonDecode(response.body);
      for (var row in jsonResponse) {
        _country.add(
            "Cid : ${row['Cid']}  name : ${row['name']}  image : ${row['image']}");
      }
    }
  } catch (e) {

  }
}
class ShowCountry extends StatefulWidget {
  const ShowCountry({super.key});

  @override
  State<ShowCountry> createState() => _ShowCountryState();
}

class _ShowCountryState extends State<ShowCountry> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreenAccent,
      appBar: AppBar(
        title: Text("Countries"),
        backgroundColor: Colors.lightGreenAccent,
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  updateCountry();
                });
              },
              icon: Icon(Icons.refresh_sharp))
        ],
      ),
      body: ListView.builder(
          itemCount: _country.length,
          itemBuilder: (context , index) => Container(
            color: index%2==0?Colors.green[600] : Colors.lightGreen[200],
            padding: EdgeInsets.all(5),
            child: Container(
              width: 300,
              height: 150,
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("${_country[index].toString()}",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w900,
                            )),

                      // Text("${tours[index].date}",
                      //     style: TextStyle(
                      //         color: Colors.black,
                      //         fontWeight: FontWeight.w400)),
                      // SizedBox(height: 10),
                      // Text("cost: \$${(tours[index].cost)} ",
                      //     style: TextStyle(
                      //         color: Colors.green[900], fontWeight: FontWeight.w700)),
                    ],
                  ),
                ],
              ),
            )
          )
      ),
    );
  }
}

// Text(_country[index].toString() ,
// style: TextStyle(color: Colors.black ,fontWeight: FontWeight.w700, fontSize: 17),),