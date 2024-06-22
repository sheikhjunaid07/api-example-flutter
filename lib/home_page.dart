import 'dart:convert';

import 'package:api_in_flutter/modal_class.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<SampleCode> sampleCode = [];
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: sampleCode.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: 500,
                    color: Colors.teal.shade300,
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    margin: EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "UserId: ${sampleCode[index].userId}",
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(
                          "Id: ${sampleCode[index].id}",
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(
                          "Title: ${sampleCode[index].title}",
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(
                          "Body: ${sampleCode[index].body}",
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  );
                });
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
  }

  Future<List<SampleCode>> getData() async {
    final response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      for (Map<String, dynamic> index in data) {
        sampleCode.add(SampleCode.fromJson(index));
      }
      return sampleCode;
    } else {
      return sampleCode;
    }
  }
}
