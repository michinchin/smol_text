import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

void main() => runApp(SmolText());

class SmolText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue, brightness: Brightness.dark),
      home: MyHomePage(title: 'ˢᴹᵒᴸ ᵀᵉˣᵀ'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _text;
  String _smolText;

  @override
  void initState() {
    _text = '';
    _smolText = '';
    super.initState();
  }

  Map<String, String> smolLetters = {
    '0': '\u2070',
    '1': '\u00B9',
    '2': '\u00B2',
    '3': '\u00B3',
    '4': '\u2074',
    '5': '\u2075',
    '6': '\u2076',
    '7': '\u2077',
    '8': '\u2078',
    '9': '\u2079',
    'a': '\u1d43',
    'b': '\u1d47',
    'c': '\u1d9c',
    'd': '\u1d48',
    'e': '\u1d49',
    'f': '\u1da0',
    'g': '\u1d4d',
    'h': '\u02b0',
    'i': '\u2071',
    'j': '\u02b2',
    'k': '\u1d4f',
    'l': '\u02e1',
    'm': '\u1d50',
    'n': '\u207f',
    'o': '\u1d52',
    'p': '\u1d56',
    'r': '\u02b3',
    's': '\u02e2',
    't': '\u1d57',
    'u': '\u1d58',
    'v': '\u1d5b',
    'w': '\u02b7',
    'x': '\u02e3',
    'y': '\u02b8',
    'A': '\u1d2c',
    'B': '\u1d2e',
    'D': '\u1d30',
    'E': '\u1d31',
    'G': '\u1d33',
    'H': '\u1d34',
    'I': '\u1d35',
    'J': '\u1d36',
    'K': '\u1d37',
    'L': '\u1d38',
    'M': '\u1d39',
    'N': '\u1d3a',
    'O': '\u1d3c',
    'P': '\u1d3e',
    'R': '\u1d3f',
    'T': '\u1d40',
    'U': '\u1d41',
    'V': '\u2c7d',
    'W': '\u1d42',
    '+': '\u207A',
    '-': '\u207B',
    '=': '\u207C',
    '': '\u207D',
    ')': '\u207E',
  };

  String _getSmol(String text) {
    String finalSmolTxt = '';
    for (int i = 0; i < text.length; i++) {
      if (text[i] == ' ') {
        finalSmolTxt += ' ';
      } else {
        if (smolLetters.containsKey(text[i])) {
          String key =
              smolLetters.keys.firstWhere((s) => s == text[i]).toString();
          if (smolLetters[key] != '?') {
            finalSmolTxt += smolLetters[key];
          } else {
            finalSmolTxt += text[i];
          }
        } else {
          finalSmolTxt += text[i];
        }
      }
    }
    return finalSmolTxt;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(children: [
          Card(
              elevation: 2.0,
              child: Row(children: [
                Expanded(
                  child: Container(
                      padding: EdgeInsets.all(10.0),
                      child: TextField(
                        style: Theme.of(context).textTheme.headline,
                        onChanged: (s) {
                          setState(() {
                            _text = s;
                            _smolText = _getSmol(_text);
                          });
                        },
                        decoration: InputDecoration(
                            hintStyle: Theme.of(context).textTheme.headline,
                            border: InputBorder.none,
                            hintText: 'Input text here'),
                      )),
                ),
              ])),
          Divider(),
          Card(
            elevation: 2.0,
            child: Stack(
              children: [
                WaveWidget(
                  config: CustomConfig(
                    gradients: [
                      [Colors.blue, Colors.black],
                      [Colors.teal, Colors.blueGrey],
                      [Colors.blue, Colors.white],
                      [Colors.teal[800], Colors.teal[100]],
                    ],
                    durations: [35000, 19440, 10800, 6000],
                    heightPercentages: [0.20, 0.23, 0.25, 0.30],
                    blur: MaskFilter.blur(BlurStyle.solid, 0),
                    gradientBegin: Alignment.bottomLeft,
                    gradientEnd: Alignment.topRight,
                  ),
                  waveAmplitude: 0,
                  backgroundColor: Colors.black,
                  size: Size(400, 200),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    _smolText,
                    style: Theme.of(context).textTheme.headline,
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Share.share(_smolText);
        },
        child: Icon(Icons.share),
      ),
    );
  }
}
