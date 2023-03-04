import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  XylophoneApp({super.key});
  // OUr key value pairs for notes and colors
  final Map keyDict = {
    Colors.red: '1',
    Colors.orange: '2',
    Colors.yellow: '3',
    Colors.green: '4',
    Colors.teal: '5',
    Colors.blue: '6',
    Colors.purple: '7',
  };

  Column buildKey(Map keyDict) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        for (final keyKey in keyDict.keys)
          Expanded(
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll<Color>(keyKey),
              ),
              onPressed: () {
                final player = AudioPlayer();
                player.play(AssetSource('note${keyDict[keyKey]}.wav'));
              },
              child: const Text('♩'),
            ),
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: buildKey(keyDict),
        ),
      ),
    );
  }
}
