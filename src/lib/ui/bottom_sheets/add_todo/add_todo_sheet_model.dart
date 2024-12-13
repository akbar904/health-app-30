import 'package:stacked/stacked.dart';
import 'package:my_app/app/app.locator.dart';
import 'package:my_app/services/todo_service.dart';

class AddTodoSheetModel extends BaseViewModel {
  final _todoService = locator<TodoService>();

  String _todoTitle = '';

  bool get canAdd => _todoTitle.trim().isNotEmpty;

  void setTodoTitle(String value) {
    _todoTitle = value;
    notifyListeners();
  }

  void addTodo() {
    if (canAdd) {
      _todoService.addTodo(_todoTitle.trim());
      notifyListeners();
    }
  }
}
