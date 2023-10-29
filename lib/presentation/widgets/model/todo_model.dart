import 'package:flutter/material.dart';
import 'package:pruebamia/presentation/widgets/shared/todo_card.dart';

class TodoModel extends ChangeNotifier {
  final List<TodoCard> todoCards = [];

  void createTodoCard(String title, List<String> tasks) {
    TodoCard newCard = TodoCard(
      title: title,
      tasks: tasks,
      //color: Colors.blue,
        color:const Color.fromARGB(255, 79, 76, 76),
    );
    todoCards.add(newCard);
    notifyListeners();
  }


  void deleteTodoCard(TodoCard card) {
  todoCards.remove(card);
  notifyListeners();
}

}