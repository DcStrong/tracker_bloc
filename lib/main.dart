import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracker_bloc/branche/bloc/branch_bloc.dart';
import 'package:tracker_bloc/branche/branch_repository.dart';
import 'package:tracker_bloc/project/bloc/project_bloc.dart';
import 'package:tracker_bloc/project/bloc/project_event.dart';
import 'package:tracker_bloc/project/bloc/project_state.dart';
import 'package:tracker_bloc/project/project_repository.dart';
import 'package:tracker_bloc/project/view/project_list.dart';

import 'branche/bloc/branch_event.dart';
import 'branche/view/branch.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => ProjectRepository(),
        ),
        RepositoryProvider(
          create: (context) => BranchRepository(),
        )
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (ctx) {
              return ProjectBloc(
                ctx.read<ProjectRepository>()
              );
            }
          ),
          BlocProvider(
            create: (ctx) {
              return BranchBloc(
                ctx.read<BranchRepository>()
              );
            }
          )
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: HomePage(),
        )
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ProjectList()
    );
  }
}
