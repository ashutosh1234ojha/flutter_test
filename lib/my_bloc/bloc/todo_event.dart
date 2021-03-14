part of 'todo_bloc.dart';

abstract class TodoEvent extends Equatable {
  const TodoEvent();
}

class LoadingEvent extends TodoEvent {
  @override
  List<Object> get props => [];
}


class RequestTodoApiClient extends TodoEvent {
  RequestTodoApiClient();

  @override
  List<Object> get props => [];
}
