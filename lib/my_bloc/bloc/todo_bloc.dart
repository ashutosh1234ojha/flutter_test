import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:udemy/my_bloc/TodoModel.dart';
import 'package:udemy/my_bloc/server/TodoApiImpl.dart';
import 'package:udemy/my_bloc/server/TodoApiService.dart';

part 'todo_event.dart';

part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoApiImpl mRepo;

  TodoBloc(TodoApiService repository) : super(TodoInitial()) {
    mRepo = repository;
  }

  @override
  Stream<TodoState> mapEventToState(
    TodoEvent event,
  ) async* {
    if (event is RequestTodoApiClient) {
      yield (RequestApiLoading());
      // }else if (event is RequestTodoApiClient) {
      // yield RequestApiLoading();
      List<TodoModel> coinModel = await mRepo.getTodoList("1");
      yield (TodoApiSuccess(coinModel));
    }
  }
}
