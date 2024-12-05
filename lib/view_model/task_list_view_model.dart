import 'package:flutter/material.dart';
import '../model/todo_model.dart';
import '../repository/task_list_repository.dart';

class TaskListProvider with ChangeNotifier {
  bool _inProgress = false;
  bool _isSuccess = false;
  String _errorMessage = '';
  List<TodoModel> _todoList = [];

  // Public getters
  bool get inProgress => _inProgress;
  bool get isSuccess => _isSuccess;
  String get errorMessage => _errorMessage;
  List<TodoModel> get todoList => _todoList;

  // Fetch task list from repository
  Future<void> getTaskList() async {
    _inProgress = true;
    _todoList.clear();
    notifyListeners();

    final response = await TaskListRepository.getTaskList();

    if (response.isSuccess) {
      final List<dynamic> data = response.responseData;
      _todoList = data.map((item) => TodoModel.fromJson(item)).toList();
      _isSuccess = true;
    } else {
      _errorMessage = response.errorMessage ?? 'Unknown error';
      _isSuccess = false;
    }

    _inProgress = false;
    notifyListeners();
  }
}
