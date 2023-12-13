import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SpeechToTextDemo(),
    );
  }
}

class SpeechToTextDemo extends StatefulWidget {
  @override
  _SpeechToTextDemoState createState() => _SpeechToTextDemoState();
}

class _SpeechToTextDemoState extends State<SpeechToTextDemo> {
  stt.SpeechToText _speechToText = stt.SpeechToText();
  String _text = 'Press the button and start speaking...';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Speech-to-Text Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_text),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _listen();
              },
              child: Text('Start Listening'),
            ),
          ],
        ),
      ),
    );
  }

  void _listen() async {
    if (await _speechToText.initialize()) {
      _speechToText.listen(
        onResult: (result) {
          setState(() {
            _text = result.recognizedWords;
          });
        },
      );
    } else {
      print('Speech recognition not available');
    }
  }
}
