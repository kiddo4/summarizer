import 'package:flutter/material.dart';
import 'package:summarizer/app/ui/widgets/home_screen_header_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            HomeScreenHeaderWidget(),
            Expanded(
              child: SizedBox(
                height: 20,
              ),
            ),
          ],
        )
        )
    );
  }
}