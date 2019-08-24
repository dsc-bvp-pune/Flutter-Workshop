import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contact',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {

  getData(){
    return http
        .get('https://mockupapi.herokuapp.com/dewanshrawat15/fetch/')
        .then((onValue) {
      print(t);
      return json.decode(onValue.body);
    });
  }

  Map data = {
    "name": "",
    "number": ""
  };

  postData(){
    var jsonData = json.encode(data);
    http.post("https://mockupapi.herokuapp.com/dewanshrawat15/post/", body: jsonData).then((response){
      var t = response.body;
      print(t);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contacts"),
      ),
      body: Center(
        child: Text(
          "Hello World",
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            onPressed: () => getData(),
            heroTag: 'image0',
            tooltip: 'Refresh',
            child: const Icon(Icons.refresh),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: FloatingActionButton(
              heroTag: 'image1',
              onPressed: () => postData(),
              tooltip: 'Add Contact',
              child: const Icon(Icons.add),
            ),
          ),
        ],
      ),
    );
  }
}
