
import 'package:flutter/foundation.dart';
import 'package:flutter_task/models/comment_model.dart';

import '../services/http_service.dart';

class CommentsProvider extends ChangeNotifier{
  List<CommentModel> commentsList=[];
  bool isLoading = false;
void getComments(int? postId)async{
  isLoading = true;
commentsList.clear();
var data =await HttpService.getComments(HttpService.apiPostComments, postId!);
if(data != null){
  for(int i=0;i<data.length;i++){
   commentsList.add(
       CommentModel(
         id: data[i]['id'],
         postId: data[i]['postId'],
         name: data[i]['name'],
         body: data[i]['body']

       )
   );
  }
  notifyListeners();
  isLoading=false;
  // print(commentsList);
}
}
void postComments(String comment)async{
  isLoading= true;
  var response =await HttpService.post(HttpService.apiPostComments);
  print(response);
  isLoading= false;
}
}