import 'package:flutter/material.dart';
import 'package:boltiot/boltiot.dart';
import 'package:http/http.dart' as http;
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       
        primarySwatch: Colors.blue,
        
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    String output='';
    Bolt myBolt = new Bolt('API_KEY','DEVICE_ID');         //declaring Bolt object named myBolt
    Future<http.Response> response = myBolt.digitalWrite('3', 'HIGH');   //storing future in response object
    response.then((response) {
      setState(() {                    //if Future opens with a value, store the body of response in output
        output = response.body;
      });

    });
    return Container(
      child: Center(
        child: Text(output),
      ),
    );
  }
}
