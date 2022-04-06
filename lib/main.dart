import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

void main() {
  runApp(const BasicPhrasesApp());
}

class BasicPhrasesApp extends StatelessWidget {
  const BasicPhrasesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> data = <String>[
    'Salut!',
    'Hallo!',
    'Mă numesc',
    'Mein Name ist',
    'Ce mai faci?',
    "Wie geht's?",
    'Frumos',
    'Schön',
    'Scuze',
    'Entschuldigung'
  ];

  final List sounds = [
    'assets/salut.mp3',
    'assets/hallo.mp3',
    'assets/manumesc.mp3',
    'assets/name.mp3',
    'assets/cumesti.mp3',
    'assets/howareu.mp3',
    'assets/frumos.mp3',
    'assets/beautiful.mp3',
    'assets/scuze.mp3',
    'assets/sorry.mp3'
  ];

  late AudioPlayer player;
  @override
  void initState() {
    super.initState();
    player = AudioPlayer();
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Basic Phrases'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(8.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 24.0,
          mainAxisSpacing: 24.0,
          childAspectRatio: 1.0,
        ),
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Colors.blueAccent,
                      Colors.lightBlueAccent,
                    ],
                  )),
              child: Stack(alignment: Alignment.center, children: <Widget>[
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                      onTap: () async {
                        await player.setAsset(sounds[index]);
                        player.play();
                      },
                      borderRadius: const BorderRadius.all(Radius.circular((20)))),
                ),
                Text(data[index], style: const TextStyle(color: Colors.white)),
              ]));
        },
      ),
    );
  }
}
