import 'package:my_app/app/app.locator.dart';
import 'package:my_app/models/todo_model.dart';
import 'package:my_app/services/todo_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends ReactiveViewModel {
  final _todoService = locator<TodoService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _dialogService = locator<DialogService>();

  List<TodoModel> get todos => _todoService.todos;

  void showAddTodoSheet() {
    _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.notice,
      title: 'Add Todo',
      description: 'Add a new todo item',
    );
  }

  void toggleTodo(String id) {
    _todoService.toggleTodo(id);
    notifyListeners();
  }

  Future<void> confirmDelete(String id) async {
    final response = await _dialogService.showDialog(
      title: 'Confirm Delete',
      description: 'Are you sure you want to delete this todo?',
      dialogPriority: DialogPriority.high,
    );

    if (response?.confirmed ?? false) {
      _todoService.deleteTodo(id);
      notifyListeners();
    }
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [_todoService];
}
