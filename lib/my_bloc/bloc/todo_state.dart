part of 'todo_bloc.dart';

abstract class TodoState {
  const TodoState();
}

class TodoInitial extends TodoState {
  // @override
  // List<Object> get props => [];
  const TodoInitial();
}
// class ScreenLoading extends TodoState {
//   @override
//   List<Object> get props => [];
// }

class RequestApiLoading extends TodoState {
  // @override
  // List<Object> get props => [];
  const RequestApiLoading();
}

class TodoApiSuccess extends TodoState {
  final List<TodoModel> coinModel;

  const TodoApiSuccess(this.coinModel);

// @override
// List<Object> get props => [coinModel];
}

class TodoApiError extends TodoState {
  const TodoApiError();
//
// @override
// List<Object> get props => [];
}

// class ProfileInitial extends ProfileState {
//   const ProfileInitial();
// }
//
// class ProfileLoading extends ProfileState {
//   const ProfileLoading();
// }
//
// class ProfileLoaded extends ProfileState {
//   final Profile profile;
//   const ProfileLoaded(this.profile);
// }
//
// class ProfileError extends ProfileState {
//   final String error;
//   const ProfileError(this.error);
// }
