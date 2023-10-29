import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pruebamia/presentation/widgets/model/todo_model.dart';

class TodoCard extends StatelessWidget {
  final Color color;
  final String title;
  final List<String> tasks;

  const TodoCard({
    Key? key,
    required this.color,
    required this.title,
    required this.tasks,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10),
          ),
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 50.0), // Agrega un padding en la parte inferior
            child: Text(
              title.toUpperCase(),
              textAlign: TextAlign.center,
              style:const TextStyle(
                fontFamily: 'Poppins',
                color: Colors.white,
                fontWeight: FontWeight.w900,
                fontSize: 25,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 5,
          left: 5,
          child: Material(
            color: const Color.fromRGBO(50, 50, 50, 1),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: IconButton(
              icon: const Icon(Icons.delete),
              iconSize: 30,
              color: Colors.red[400],
              onPressed: () {
                Provider.of<TodoModel>(context, listen: false).deleteTodoCard(this);
              },
            ),
          ),
        ),
      ],
    );
  }
}
