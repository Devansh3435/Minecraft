import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(Minecraft());

class Minecraft extends StatelessWidget {

  void playSound(int soundNumber){
    final player = AudioPlayer();
    player.play(AssetSource('sound$soundNumber.mp3'));
  }

  void playIntroSound() {
    final player = AudioPlayer();
    player.play(AssetSource('sound0.mp3'));
  }

  Widget buildKey({Color color, int soundNumber, String imagePath}) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          if (soundNumber == 0) {
            playIntroSound();
          } else {
            playSound(soundNumber);
          }
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(color),
              ),
              onPressed: () {}, // Button is not pressable directly
              child: Container(), // Empty container to reserve space
            ),
            if (imagePath != null)
              Positioned.fill(
                child: Image.asset(imagePath),
              ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: InkWell(
            onTap: () {
              playIntroSound();
            },
            child: Text('Minecraft'),
          ),
          centerTitle: true,
        ),
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildKey(color: Colors.red, soundNumber: 1, imagePath: 'images/image2.png'),
              buildKey(color: Colors.orange, soundNumber: 2, imagePath: 'images/image3.png'),
              buildKey(color: Colors.yellow, soundNumber: 3, imagePath: 'images/image4.png'),
              buildKey(color: Colors.green, soundNumber: 4, imagePath: 'images/image5.png'),
              buildKey(color: Colors.teal, soundNumber: 5, imagePath: 'images/image6.png'),
              buildKey(color: Colors.blue, soundNumber: 6, imagePath: 'images/image8.png'),
              buildKey(color: Colors.purple, soundNumber: 7, imagePath: 'images/image7.png'),
            ],
          ),
        ),
      ),
    );
  }
}