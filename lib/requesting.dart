//import 'package:boltiot/urls.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<dynamic> requestFrom(var url)  async {

    var response;
    await http.get(url)  //sending an http request
        .then((resp){   //if the request is successful, store the response in response variable
            response = resp.body;
        }).catchError((err){  //if request is unsuccessful, store error message in response variable
            response = jsonDecode('{"success":"0", "message":$err}');
        });
    return response;   //return response variable
}