import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:todo_app_bloc/entities/todo.dart';
import 'package:todo_app_bloc/repositories/todo/TodoRepository.dart';

class TodoRepositoryImpl extends TodoRepository {
  @override
  Stream<DocumentReference> add({@required Todo todo}) {
    Map<String, dynamic> todoJson = todo.toJson();
    return FirebaseFirestore.instance
        .collection('todos')
        .add(todoJson)
        .asStream();
  }

  @override
  Stream<DocumentReference> update(
      {@required Todo todo, @required String documentId}) {
    Map<String, dynamic> todoJson = todo.toJson();
    return FirebaseFirestore.instance
        .collection('todos')
        .doc(documentId)
        .update(todoJson)
        .asStream();
  }
}
