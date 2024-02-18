import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:summarizer/app/ui/widgets/error_dialog_widget.dart';
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
  final FocusNode _textFieldFocus = FocusNode();
  bool _loading = false;
  String? _responseText = '';

  Future<void> _checkSummarize(String text) async {
    setState(() {
      _loading = true;
    });
    
      final model = GenerativeModel(
        model: 'gemini-pro', 
        apiKey: _apiKey,
        safetySettings: [
          SafetySetting(HarmCategory.sexuallyExplicit, HarmBlockThreshold.none)
        ],
        );

      try {
        final String prompt =
      'Please review the provided content and create a succinct bullet-point summary focusing on the main ideas and essential details.'
      ' Disregard any extraneous elements like menus, promotions, or unrelated information. '
      'Additionally, feel free to correct any grammatical errors or improve the language for clarity and coherence.'
      'The content is as follows: $text';
          
      final content = [Content.text(prompt)];
      final response = await model.generateContent(content);
      
      
      print(response.text);
       if (response == null) {
         _showError('No response from gemini.');
        return;
       } else {
        _responseText = response.text;
        setState(() {
      _loading = false;
         });
       }
        
      } catch (e) {
        _showError(e.toString());
            setState(() {
              _loading = false;
            });
      } finally {
      _textController.clear();
      setState(() {
        _loading = false;
      });
      _textFieldFocus.requestFocus();
    }
     
  }
   void _showError(String message) {
          showDialog(
            context: context,
            builder: (context) {
              return ErrorDialog(
                title: 'Something went wrong',
                message: message,
              );
            },
          );


      
}

  @override
  Widget build(BuildContext context) {
    var textFieldDecoration = InputDecoration(
      contentPadding: const EdgeInsets.all(15),
      hintText: 'Paste content to summarize/correct...',
      border: OutlineInputBorder(
        borderRadius: const BorderRadius.all(
          Radius.circular(14),
        ),
        borderSide: BorderSide(
          color: Theme.of(context).colorScheme.secondary,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(
          Radius.circular(14),
        ),
        borderSide: BorderSide(
          color: Theme.of(context).colorScheme.secondary,
        ),
      ),
    );
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const HomeScreenHeaderWidget(),
            _apiKey.isNotEmpty ? Column(
              children: [
                 Expanded(
                    child: SizedBox(
                      height: 20,
                      child: Text(
                        'Check and summarize it!',
                        style: GoogleFonts.inter().copyWith(
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          color: const Color(0xFF19202D),
                        ),
                      ),
                    ),
                  ),
                   Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 25,
              horizontal: 15,
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    autofocus: true,
                    focusNode: _textFieldFocus,
                    decoration: textFieldDecoration,
                    controller: _textController,
                    onSubmitted: (String value) {
                      _checkSummarize(value);
                    },
                  ),
                ),
                const SizedBox.square(
                  dimension: 15,
                ),
                if (!_loading)
                  IconButton(
                    onPressed: () async {
                      _checkSummarize(_textController.text);
                    },
                    icon: Icon(
                      Icons.send_rounded,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  )
                else
                  const CircularProgressIndicator(),
              ],
            ),
          ),
              ],
            )
           :
           Center(
            child: Text('No API key found. Please provide an API Key.'),
           )
          ],
        )
        ),
        
        
    );
    
  }
}