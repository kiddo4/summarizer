import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController? textController;
  const TextFieldWidget({
    super.key,
    this.textController,
    });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      height: 60.0,
      child: Row(
        children: [
         SingleChildScrollView(
              child: TextField(
                controller: textController,
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  filled: true,
                  fillColor: Colors.deepPurple,
                  hintText: 'paste the text......',
                  hintStyle: const TextStyle(color: Colors.black),
                ),
                minLines: 1, // <-- set minLines to 1 to make it scrollable
                maxLines: null, // <-- set maxLines to null to remove the maximum line limit
              ),
            ),
        ],
      ),
    );
  }
}