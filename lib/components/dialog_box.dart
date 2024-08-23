// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:my_todo_app/components/button_widget.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  DialogBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return AlertDialog(
      backgroundColor: Colors.teal[200],
      content: Container(
        height: MediaQuery.of(context).orientation == Orientation.portrait
            ? size.height * 15 / 100
            : size.height * 30 / 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Add a new task",
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyButton(
                  text: "Save",
                  onPressed: onSave,
                  color: Colors.teal,
                ),
                MyButton(
                  text: "Cancel",
                  onPressed: onCancel,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class ContextDialogBox extends StatelessWidget {
  VoidCallback onCancel;
  String text;

  ContextDialogBox({
    super.key,
    required this.onCancel,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return AlertDialog(
      backgroundColor: Colors.teal[200],
      content: Container(
        height: MediaQuery.of(context).orientation == Orientation.portrait
            ? size.height * 15 / 100
            : size.height * 30 / 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              text,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
              // overflow: TextOverflow.ellipsis,
              softWrap: true,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MyButton(
                  text: "Exit",
                  onPressed: onCancel,
                  color: Colors.teal,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
