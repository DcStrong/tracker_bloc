import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracker_bloc/branche/view/branch.dart';
import 'package:tracker_bloc/project/bloc/project_bloc.dart';
import 'package:tracker_bloc/project/bloc/project_event.dart';
import 'package:tracker_bloc/project/bloc/project_state.dart';

class ProjectList extends StatelessWidget {
  const ProjectList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProjectBloc, ProjectState>(
      builder: (context, state) {
        return Column(
          children: [
            TextButton(
              onPressed: () {
                context
                  .read<ProjectBloc>()
                  .add(LoadingProject());
              },
              child: Text('get'),
            ),
            if (state is ProjectLoaded)
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: state.projects.length,
                itemBuilder: (ctx, i) {
                  return Column(
                    children: [
                      Text(state.projects[i].name),
                      Text(state.projects[i].loadingBranches.toString()),
                      Checkbox(
                        value: state.projects[i].loadingBranches,
                        onChanged: (bool? value) {
                          context
                            .read<ProjectBloc>()
                            .add(UpdatedProject(state.projects[i].copyWith(loadingBranches: !state.projects[i].loadingBranches!)));
                        }
                      ),
                      BranchList(),
                    ],
                  );
                }
              ),
            ),
          ],
        );
      },
    );
  }
}