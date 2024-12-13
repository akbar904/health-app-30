import 'package:equatable/equatable.dart';

class TodoModel extends Equatable {
  final String id;
  final String title;
  final bool isCompleted;
  final DateTime createdAt;

  const TodoModel({
    required this.id,
    required this.title,
    this.isCompleted = false,
    required this.createdAt,
  });

  TodoModel copyWith({
    String? id,
    String? title,
    bool? isCompleted,
    DateTime? createdAt,
  }) {
    return TodoModel(
      id: id ?? this.id,
      title: title ?? this.title,
      isCompleted: isCompleted ?? this.isCompleted,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  List<Object?> get props => [id, title, isCompleted, createdAt];
}
