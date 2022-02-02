import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tracker_bloc/project/entity/project_entity.dart';
import 'package:tracker_bloc/project/model/project_model.dart';

class SharedPreferencess {
  saveListObjByKey(String key, List<Project> list) async {
    final p = await prefs;
    List lists = list.map((e) => e.toEntity().toJson()).toList();
    String listToJson = jsonEncode(lists);
    print(listToJson);
    await p.setString(key, listToJson);
  }

  Future<List<Project>> getJsonByKey(String key) async {
    final p = await prefs;
    final result = await p.getString(key);
    if (result == null) {
      throw ErrorDescription('nothing was found under this key');
    }
    List<dynamic> dynamicList = jsonDecode(result);

    return dynamicList
        .map((e) => Project.fromEntity(ProjectEntity.fromJson(e)))
        .toList();
  }

  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();
}
