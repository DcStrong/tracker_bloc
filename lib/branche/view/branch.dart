import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracker_bloc/branche/bloc/branch_bloc.dart';
import 'package:tracker_bloc/branche/bloc/branch_event.dart';
import 'package:tracker_bloc/branche/bloc/branch_state.dart';

class BranchList extends StatelessWidget {
  const BranchList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BranchBloc, BranchState>(
      builder: (ctx, state) {
        if (state is BranchLoaded) {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: state.branche.length,
            itemBuilder: (ctx, i) {
              return Text(state.branche[i].name);
            }
          );
        }
        return TextButton(
          onPressed: () {
            context
              .read<BranchBloc>()
              .add(LoadingBranch());
          },
          child: Text('get'),
        );
      },
    );
  }
}