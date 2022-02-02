import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracker_bloc/branche/view/branch.dart';
import 'package:tracker_bloc/project/bloc/project_bloc.dart';
import 'package:tracker_bloc/project/bloc/project_event.dart';
import 'package:tracker_bloc/project/bloc/project_state.dart';
import 'package:tracker_bloc/project/model/project_model.dart';

class ProjectList extends StatelessWidget {
  const ProjectList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProjectBloc, ProjectState>(
      builder: (context, state) {
        if (state is ProjectLoaded)
          return Expanded(
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: state.projects.length,
                itemBuilder: (ctx, i) {
                  // return projectCard(ctx, state.projects[i]);
                  return tileItem(context, i, state.projects[i]);
                }),
          );
        return Container();
      },
    );
  }

  Widget tileItem(BuildContext context, int index, Project project) {
    return Hero(
        tag: 'card$index',
        child: Stack(
          children: [
            Material(
                type: MaterialType.transparency,
                child: projectCard(context, project)),
            Positioned(
              left: 0.0,
              top: 0.0,
              bottom: 0.0,
              right: 0.0,
              child: Material(
                type: MaterialType.transparency,
                child: InkWell(
                    // onTap: () async {
                    //   await Future.delayed(Duration(milliseconds: 200));
                    //   Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context) {
                    //         return detailCardProject(index);
                    //       },
                    //       fullscreenDialog: true,
                    //     ),
                    //   );
                    // },
                    ),
              ),
            ),
          ],
        ));
  }

  Widget projectCard(BuildContext context, Project project) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          ListTile(
            leading: Icon(Icons.arrow_drop_down_circle),
            title: Text(project.name),
            subtitle: Text(
              'Secondary Text',
              style: TextStyle(color: Colors.black.withOpacity(0.6)),
            ),
          ),
          ExpansionTile(
              onExpansionChanged: (bool value) {
                if (value) {
                  if (project.brances == null) {
                    context.read<ProjectBloc>().add(LoadingBranch(project));
                  }
                }
              },
              title: Text('Branch'),
              children: project.brances != null
                  ? [BranchList(branchList: project.brances!)]
                  : [CircularProgressIndicator()]),
          ButtonBar(
            alignment: MainAxisAlignment.start,
            children: [
              TextButton(
                onPressed: () {
                  // Perform some action
                },
                child: const Text('ACTION 1'),
              ),
              TextButton(
                onPressed: () {
                  // Perform some action
                },
                child: const Text('ACTION 2'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget detailCardProject(int index) {
    return Hero(
      tag: 'card$index',
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white.withOpacity(0.2),
        ),
      ),
    );
  }
}
