import 'dart:js';

import 'package:flutter/material.dart';
import 'package:tracker_bloc/branche/model/branch_model.dart';

class BranchList extends StatelessWidget {
  const BranchList({Key? key, required this.branchList}) : super(key: key);
  final List<BranchModel> branchList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: branchList.length,
      itemBuilder: (ctx, i) {
        return Text(branchList[i].name);
      }
    );
  }
}