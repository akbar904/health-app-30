import 'package:logger/logger.dart';
import 'package:my_app/models/todo_model.dart';

class TodoService {
  final _logger = Logger();
  final List<TodoModel> _todos = [];

  List<TodoModel> get todos => _todos;

  void addTodo(String title) {
    final todo = TodoModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: title,
      createdAt: DateTime.now(),
    );
    _todos.add(todo);
    _logger.i('Added todo: ${todo.title}');
  }

  void toggleTodo(String id) {
    final index = _todos.indexWhere((todo) => todo.id == id);
    if (index != -1) {
      final todo = _todos[index];
      _todos[index] = todo.copyWith(isCompleted: !todo.isCompleted);
      _logger.i('Toggled todo: ${todo.title}');
    }
  }

  void deleteTodo(String id) {
    _todos.removeWhere((todo) => todo.id == id);
    _logger.i('Deleted todo with id: $id');
  }
}
