import 'dart:convert';
import 'package:http/http.dart' as http;


class HttpService{
  static String base = "https://jsonplaceholder.typicode.com";
  /*APIs*/
  static String apiUsersList = "/users";
  static String apiPostsList ="/posts";

  /*HTTP requests*/

static Future<List<dynamic>?> get(String api)async{
    var url = Uri.parse(base+api);
    var response = await http.get(url);
    // print(response.statusCode);
    if(response.statusCode == 200){
      var jsonData = jsonDecode(response.body);
      return jsonData;
    }
    else{
      return null;
    }

  }

}