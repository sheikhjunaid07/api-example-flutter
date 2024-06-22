import 'dart:convert';
import 'package:api_in_flutter/advanced_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AdvancedNew extends StatefulWidget {
  const AdvancedNew({super.key});

  @override
  State<AdvancedNew> createState() => _AdvancedNewState();
}

class _AdvancedNewState extends State<AdvancedNew> {
  List<AdvancedData> advancedNew = [];
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: advancedNew.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: 250,
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 111, 225, 240),
                        border: Border.all(color: Colors.black, width: 2.0)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        getText(
                            index, "Id: ", advancedNew[index].id.toString()),
                        getText(index, "Name: ",
                            advancedNew[index].name.toString()),
                        getText(index, "Username: ",
                            advancedNew[index].username.toString()),
                        getText(index, "Email: ",
                            advancedNew[index].email.toString()),
                        getText(index, "Phone: ",
                            advancedNew[index].phone.toString()),
                        getText(index, "Website: ",
                            advancedNew[index].website.toString()),
                        getText(index, "Address: ",
                            '${advancedNew[index].address.street.toString()}, ${advancedNew[index].address.suite.toString()}, ${advancedNew[index].address.city.toString()}, - ${advancedNew[index].address.zipcode.toString()}, ')
                      ],
                    ),
                  );
                });
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }

  Text getText(int index, String fieldName, String contents) {
    return Text.rich(TextSpan(children: [
      TextSpan(text: fieldName, style: TextStyle(fontSize: 18)),
      TextSpan(text: contents, style: TextStyle(fontSize: 18)),
    ]));
  }

  Future<List<AdvancedData>> getData() async {
    final response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map<String, dynamic> index in data) {
        advancedNew.add(AdvancedData.fromJson(index));
      }
      return advancedNew;
    } else {
      return advancedNew;
    }
  }
}
