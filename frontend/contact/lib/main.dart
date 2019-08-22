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
        primarySwatch: Colors.orange,
      ),
      home: MyHomePage(title: 'Contact'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  getData(){
    return http
        .get('http://localhost:8000/dewanshrawat15/fetch/')
        .then((onValue) {
      return json.decode(onValue.body);
    });
  }

  Map data = {
    "name": "Dewansh Rawat",
    "number": "+91-9968858476"
  };

  postData(){
    var jsonData = json.encode(data);
    http.post("http://localhost:8000/dewanshrawat15/post/", body: jsonData).then((response){
      var t = response.body;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: StreamBuilder(
            stream: getData().asStream(),
            builder: (BuildContext context, AsyncSnapshot snapshot){
              if (snapshot.hasData){
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index){
                    return ListTile(
                      title: Text(snapshot.data[index]["name"]),
                      subtitle: Text(snapshot.data[index]["number"]),
                    );
                  },
                );
              }
            },
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            onPressed: () => setState((){}),
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
