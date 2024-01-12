import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'pagetwo.dart';

const String _baseURL = 'http://10.0.2.2:8080/ToursProject';
// const String _baseURL = 'https://mariofinalproject.000webhostapp.com/';
class Tour {
  String image = "";
  String location = "";
  String event = "";
  String date = "";
  double cost = 0;

  Tour(this.image, this.location, this.event, this.date, this.cost);

  @override
  String toString() {
    return '''
Location : $location,
Event: $event,
Date: $date,
Price : $cost,
''';
  }
}

List<Tour> tours = [
  // Tour ('images/ehden.jpg' , 'ehden','hiking','2024-1-1',100),
];

void updateTours() async {
  try {
    // final url = Uri.https(_baseURL, '/getTours.php');
    final url = Uri.parse('$_baseURL/getTours.php');
    final response = await http.get(url).timeout(const Duration(seconds: 5));
    tours.clear();
    if (response.statusCode == 200) {
      final jsonResponse = convert.jsonDecode(response.body);
      for (var row in jsonResponse) {

        Tour tour = Tour
          (row['image'],
            row['location'],
            row['event'],
            row['date'],
            double.parse(row['cost']));
        tours.add(tour);
      }
    }
  } catch (e) {}
}

class ShowTours extends StatelessWidget {
  const ShowTours({super.key});

  @override
  Widget build(BuildContext context) {
    return
      ListView.builder(
        itemCount: tours.length,
        itemBuilder: (context, index) => Container(
              color:
                  index % 2 == 0 ? Colors.green[600] : Colors.lightGreen[200],
              padding: EdgeInsets.all(5),
              child: Container(
                width: 300,
                height: 150,
                color: Colors.white,
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const pageTwo(),
                        settings: RouteSettings(arguments: tours[index])));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Image(
                          height: 200,
                          width: 200,
                          image: AssetImage(tours[index].image),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("${tours[index].location} ${tours[index].event}",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w900)),
                          Text("${tours[index].date}",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400)),
                          SizedBox(height: 10),
                          Text("cost: \$${(tours[index].cost)} ",
                              style: TextStyle(
                                  color: Colors.green[900], fontWeight: FontWeight.w700)),
                        ],
                      ),
                      SizedBox(width: 7),
                    ],
                  ),
                )),
            )
    );

  }
}
