import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:my_app/widgets/todo_item.dart';
import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo App'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: viewModel.showAddTodoSheet,
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: viewModel.todos.length,
        itemBuilder: (context, index) {
          final todo = viewModel.todos[index];
          return TodoItem(
            todo: todo,
            onToggle: () => viewModel.toggleTodo(todo.id),
            onDelete: () => viewModel.confirmDelete(todo.id),
          );
        },
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(BuildContext context) => HomeViewModel();
}
