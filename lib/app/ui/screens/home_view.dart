import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:summarizer/app/ui/widgets/home_screen_header_widget.dart';
import 'package:summarizer/app/ui/widgets/text_field_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
 
  static const _apiKey = String.fromEnvironment('API_KEY');
  final _textController =  TextEditingController();

  void checkSummarize() async {
      final model = GenerativeModel(model: 'gemini-pro', apiKey: _apiKey);

      final prompt = 'Write a story about a magic backpack: $_textController';
      final content = [Content.text(prompt)];
      final response = await model.generateContent(content);

      print(response.text);
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const HomeScreenHeaderWidget(),
            const Expanded(
              child: SizedBox(
                height: 20,
              ),
            ),
            TextFieldWidget(
              textController: _textController,
            )
          ],
        )
        )
    );
  }
}