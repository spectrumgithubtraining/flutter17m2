import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TextToSpeechDemo(),
    );
  }
}

class TextToSpeechDemo extends StatefulWidget {
  @override
  _TextToSpeechDemoState createState() => _TextToSpeechDemoState();
}

class _TextToSpeechDemoState extends State<TextToSpeechDemo> {
  FlutterTts flutterTts = FlutterTts();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Text-to-Speech Demo'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _speak('Hello, this is a text-to-speech demo.');
          },
          child: Text('Speak'),
        ),
      ),
    );
  }

  Future _speak(String text) async {
    await flutterTts.setLanguage('ar-tn');
    await flutterTts.setPitch(2);
    await flutterTts.speak(text);
  }
}
