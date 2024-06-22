import 'dart:convert';

import 'package:api_in_flutter/model_new.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NewFile extends StatefulWidget {
  const NewFile({super.key});

  @override
  State<NewFile> createState() => _NewFileState();
}

class _NewFileState extends State<NewFile> {
  List<ModelNew> modelNew = [];
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: modelNew.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: 500,
                    color: Colors.green.shade300,
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    margin: const EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Id: ${modelNew[index].id}",
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(
                          "Name: ${modelNew[index].name}",
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(
                          "City: ${modelNew[index].city}",
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

  Future<List<ModelNew>> getData() async {
    final response = await http.get(Uri.parse(
        "https://run.mocky.io/v3/89af236c-5591-4de5-aa38-27ec95a6c9c5"));
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      for (Map<String, dynamic> index in data) {
        modelNew.add(ModelNew.fromJson(index));
      }
      return modelNew;
    } else {
      return modelNew;
    }
  }
}
