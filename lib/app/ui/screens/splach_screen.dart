import 'package:flutter/material.dart';
import 'package:summarizer/app/ui/screens/home_view.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
   @override
  void initState() {
    super.initState();
    navigate();
    
    // Continue the animation for a specified duration
  }

void navigate() async { 
    Future.delayed(const Duration(seconds: 5),
    () {
      Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const HomeView()),
          );
    }
    );
}
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Summarizer'
        ),
      ),
    );
  }
}