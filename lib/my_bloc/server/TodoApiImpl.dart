

import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

import '../TodoModel.dart';
import 'TodoApiService.dart';

class TodoApiImpl extends TodoApiService {
  /*
    Get List of Coins
   */
  @override
  Future<List<TodoModel>> getTodoList(String coins) async {
    var urlBuilder = new StringBuffer();
    urlBuilder.write("https://jsonplaceholder.typicode.com/todos/");


    var response = await http.get(urlBuilder.toString().trim());
    print('Response');
    print('Response  '+response.body);
    List<TodoModel> listCoins = [];
    if (response.statusCode == 200) {
      dynamic result = convert.jsonDecode(response.body);
      for (var coinData in result) {
        TodoModel coinModel = TodoModel.fromJson(coinData);
        listCoins.add(coinModel);
      }
      return listCoins;
    }
    throw "Unable to Fetch Data";
  }
}
