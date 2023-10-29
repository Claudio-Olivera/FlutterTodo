import 'package:flutter/material.dart';
import 'package:pruebamia/presentation/widgets/shared/todo_card.dart';

class TodoDetailsPage extends StatelessWidget {
  final TodoCard todoCard;

  const TodoDetailsPage({Key? key, required this.todoCard}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(todoCard.title),
      ),
      body: ListView(
        children: todoCard.tasks.map((task) => CheckboxListTile(
          title: Text(task),
          value: false,
          onChanged: (bool? value) {
            // Aquí puedes manejar el cambio de estado del checkbox
          },
        )).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Icon(Icons.home),
      ),
    );
  }
}
