import 'package:flutter/material.dart';
import 'package:tracker_bloc/project/bloc/project_bloc.dart';
import 'package:tracker_bloc/project/bloc/project_event.dart';
import 'package:tracker_bloc/project/view/project_list.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          searchProject(context),
          ProjectList(),
        ],
      )
    );
  }

  Widget searchProject(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return Row(
      children: [
        TextButton(
          onPressed: () {
            context
              .read<ProjectBloc>()
              .add(LoadingProject());
          },
          child: Text('get'),
        ),
        Expanded(
          child: TextField(
            controller: controller,
          ),
        )
      ],
    );
  }
}