import 'package:flutter/foundation.dart';
import 'package:flutter_task/models/user_model.dart';
import 'package:flutter_task/services/http_service.dart';
// import 'package:provider/provider.dart';

class UsersProvider extends ChangeNotifier{
  bool isLoading = false;
List<UserModel> usersList = [];
void getUsers()async{
  isLoading = true;
  // I could use the another method of fetching data with the key .then() but I didn't want to add additional lines of codes instead I used the optional one.
  var data =await HttpService.get(HttpService.apiUsersList);
  if(data != null){
    for(int i=0;i<data.length;i++){
      usersList.add(UserModel(
          id: data[i]['id'],
          username: data[i]['username']
       )
      );
    }
  }
  notifyListeners();
  isLoading = false;
}
}