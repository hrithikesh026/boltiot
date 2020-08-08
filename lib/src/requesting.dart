
import 'package:http/http.dart' as http;


Future<dynamic> requestFrom(var url)  async {
    var response;
    response = await http.get(url); //sending an http request

    return response; //return response variable
}