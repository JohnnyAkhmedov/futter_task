import 'dart:convert';
import 'package:http/http.dart' as http;


class HttpService{
  static String base = "https://jsonplaceholder.typicode.com";
  static var header = {'Content-type': 'application/json; charset=UTF-8'};
  /*APIs*/
  static String apiUsersList = "/users";
  static String apiPostsList ="/posts";
  static String apiPostComments = "/comments?postId=";


  /*HTTP requests*/

  static Future<List<dynamic>?> get(String api)async{
    var url = Uri.parse(base+api);
    var response = await http.get(url,headers: header);
    // print(response.statusCode);
    if(response.statusCode == 200){
      var jsonData = jsonDecode(response.body);
      return jsonData;
    }
    else{
      return null;
    }

  }
  static Future<List<dynamic>?> getComments(String api,int postId)async{
    var url = Uri.parse(base+api+postId.toString());
    var response = await http.get(url,headers: header);
    // print(response.statusCode);
    if(response.statusCode == 200){
      var jsonData = jsonDecode(response.body);
      return jsonData;
    }
    else{
      return null;
    }

  }
  static Future<String?> post(String api)async{
    var url = Uri.parse(base+api);
    var body = jsonEncode({
      "title":"foo",
      "body":"bar",
      "userId": 1
    });
    var response = await http.post(url,headers: header,body: body);
    // print(response.statusCode);
    if(response.statusCode == 200 || response.statusCode==201){
      // var jsonData = jsonDecode(response.body);
      return response.body;
    }
    else{
      return null;
    }

  }
}