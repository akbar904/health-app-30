import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'add_todo_sheet_model.dart';

class AddTodoSheet extends StackedView<AddTodoSheetModel> {
  final Function(SheetResponse response)? completer;
  final SheetRequest request;

  const AddTodoSheet({
    required this.completer,
    required this.request,
    Key? key,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    AddTodoSheetModel viewModel,
    Widget? child,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Add New Todo',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          TextField(
            onChanged: viewModel.setTodoTitle,
            decoration: const InputDecoration(
              hintText: 'Enter todo title',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () =>
                    completer?.call(SheetResponse(confirmed: false)),
                child: const Text('Cancel'),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: viewModel.canAdd
                    ? () {
                        viewModel.addTodo();
                        completer?.call(SheetResponse(confirmed: true));
                      }
                    : null,
                child: const Text('Add'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  AddTodoSheetModel viewModelBuilder(BuildContext context) =>
      AddTodoSheetModel();
}
