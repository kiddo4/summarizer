import 'package:flutter/material.dart';
import 'package:summarizer/app/ui/widgets/home_screen_header_widget.dart';
import 'package:summarizer/app/ui/widgets/text_field_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final textController = TextEditingController();
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
              textController: textController,
            )
          ],
        )
        )
    );
  }
}