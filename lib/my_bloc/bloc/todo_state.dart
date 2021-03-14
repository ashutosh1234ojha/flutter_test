part of 'todo_bloc.dart';

abstract class TodoState extends Equatable {
  const TodoState();
}

class TodoInitial extends TodoState {
  @override
  List<Object> get props => [];
}
class ScreenLoading extends TodoState {
  @override
  List<Object> get props => [];
}

class RequestApiLoading extends TodoState {
  @override
  List<Object> get props => [];
}

class TodoApiSuccess extends TodoState {
  final List<TodoModel> coinModel;

  TodoApiSuccess(this.coinModel);

  @override
  List<Object> get props => [coinModel];
}

class TodoApiError extends TodoState {
  TodoApiError();

  @override
  List<Object> get props => [];
}