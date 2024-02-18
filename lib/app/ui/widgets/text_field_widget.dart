import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController? textController;
  final Future<void> Function()? onPressed;

  // Add default value for textController and correct parameter order
  TextFieldWidget({
    Key? key,
    this.textController,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      height: 60.0,
      child: Row(
        children: [
          // Wrap the TextField in an Expanded widget to occupy remaining space
          Expanded(
            child: SingleChildScrollView(
              child: TextField(
                controller: textController,
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  filled: true,
                  fillColor: Colors.deepPurple,
                  hintText: 'Paste the text...',
                  hintStyle: const TextStyle(color: Colors.black),
                ),
                minLines: 1,
                maxLines: null,
              ),
            ),
          ),
          // Correctly handle onPressed function by adding null check
          IconButton(
            onPressed: onPressed != null ? () => onPressed!() : null,
            icon: Icon(Icons.send_and_archive_rounded),
          )
        ],
      ),
    );
  }
}
