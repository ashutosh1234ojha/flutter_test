import '../TodoModel.dart';

abstract class TodoApiService {
  Future<List<TodoModel>> getTodoList(String id);
}
