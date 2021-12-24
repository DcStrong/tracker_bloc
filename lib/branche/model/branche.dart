import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class BrancheModel extends Equatable {
  final String name;
  // final String title;
  // final bool def;

  const BrancheModel({
    required this.name,
    // required this.title,
    // required this.def,
  });


  factory BrancheModel.fromJSON(Map<String, dynamic> jsonMap) => BrancheModel(
    name: jsonMap['name'] ?? null,
    // title: jsonMap['title'] ?? null,
    // def: jsonMap['def'] ?? false,
  );

  @override
  List<dynamic> get props => [name];
}