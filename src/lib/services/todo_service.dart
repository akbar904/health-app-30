import 'package:logger/logger.dart';
import 'package:my_app/models/todo_model.dart';
import 'package:stacked/stacked.dart';

class TodoService with ListenableServiceMixin {
  TodoService() {
    listenToReactiveValues([_todos]);
  }

  final _logger = Logger();
  final ReactiveValue<List<TodoModel>> _todos = ReactiveValue<List<TodoModel>>([]);

  List<TodoModel> get todos => _todos.value;

  void addTodo(String title) {
    final todo = TodoModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: title,
      createdAt: DateTime.now(),
    );
    _todos.value = [..._todos.value, todo];
    _logger.i('Added todo: ${todo.title}');
  }

  void toggleTodo(String id) {
    final index = _todos.value.indexWhere((todo) => todo.id == id);
    if (index != -1) {
      final todo = _todos.value[index];
      final updatedTodos = [..._todos.value];
      updatedTodos[index] = todo.copyWith(isCompleted: !todo.isCompleted);
      _todos.value = updatedTodos;
      _logger.i('Toggled todo: ${todo.title}');
    }
  }

  void deleteTodo(String id) {
    _todos.value = _todos.value.where((todo) => todo.id != id).toList();
    _logger.i('Deleted todo with id: $id');
  }
}