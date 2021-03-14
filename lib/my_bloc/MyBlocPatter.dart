import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy/my_bloc/BlocHome.dart';
import 'package:udemy/my_bloc/server/TodoApiImpl.dart';
import 'package:udemy/my_bloc/server/TodoApiService.dart';
import 'ShimmerWidget.dart';
import 'TodoModel.dart';
import 'bloc/todo_bloc.dart';
//https://medium.com/nerd-for-tech/simple-github-profile-page-display-app-using-github-api-and-flutter-using-bloc-pattern-62513f1cfbcb
class MyBlocPatter extends StatefulWidget {
  @override
  _MyBlocPatterState createState() => _MyBlocPatterState();
}

class _MyBlocPatterState extends State<MyBlocPatter> {
  TodoApiService repository;

  TodoBloc baseBloc;

  @override
  Widget build(BuildContext context) {
    repository = TodoApiImpl();
    baseBloc = TodoBloc(repository);
    return BlocProvider(
      create: (BuildContext context) =>baseBloc,
      child: BlocHome(),
    );
  }
}
