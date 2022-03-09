import 'package:flutter/foundation.dart';
import 'package:flutter_task/models/post_model.dart';
// import 'package:provider/provider.dart';

import '../services/http_service.dart';

class PostsProvider extends ChangeNotifier{
  bool isLoading = false;
  List<PostModel> userPosts = [];
  void getPosts(int index)async{
    isLoading = true;
    var data =await HttpService.get(HttpService.apiPostsList);
    // I could use the another method of fetching data with the key .then() but I didn't want to add additional lines of codes instead I used the optional one.
    if(data != null){
      for(int i=0;i<data.length;i++){
        if(data[i]['userId']==index+1){
        userPosts.add(
            PostModel(
                userId: data[i]['userId'],
                id: data[i]['id'],
                title: data[i]['title'],
                body: data[i]['body']

            )
        );
        }


      }
    }
    notifyListeners();
    isLoading = false;
  }
}