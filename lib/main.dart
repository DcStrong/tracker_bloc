import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracker_bloc/branche/branch_repository.dart';
import 'package:tracker_bloc/project/bloc/project_bloc.dart';
import 'package:tracker_bloc/project/project_repository.dart';
import 'package:tracker_bloc/project/view/project_list.dart';
import 'package:tracker_bloc/view/home.dart';

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
                ctx.read<ProjectRepository>(),
                ctx.read<BranchRepository>()
              );
            }
          ),
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