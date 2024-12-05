import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:technical_task_assignment_1/resource/app_string.dart';
import '../resource/custom_widgets/custom_loading_widget.dart';
import '../view_model/task_list_view_model.dart';

class TaskListView extends StatelessWidget {
  const TaskListView({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<TaskListProvider>(context, listen: false);
      if (provider.todoList.isEmpty && !provider.inProgress) {
        provider.getTaskList();
      }
    });

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: const Text(
          AppStrings.taskList,
          style: TextStyle(fontSize: 21, color: Colors.white),
        ),
      ),
      body: Consumer<TaskListProvider>(
        builder: (context, provider, child) {
      if (provider.inProgress) {
        return const Center(child: CustomLoadingWidget());
      }

      if (!provider.isSuccess) {
        return Center(child: Text(provider.errorMessage));
      }

      return ListView.builder(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(10),
        itemCount: provider.todoList.length,
        itemBuilder: (context, index) {
          final task = provider.todoList[index];


          return ListTile(
            leading: CircleAvatar(child: Text(task.id.toString()?? ""),),
            title: Text(task.title.toString()??""),
            subtitle: Text("User id: ${task.userId}"),
            trailing: Text(task.completed.toString()),
          );
        },
      );}),
    );
  }
}


