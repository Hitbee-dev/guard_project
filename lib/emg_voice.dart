import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';

class EMGVoice extends StatefulWidget {
  @override
  _EMGVoiceState createState() => _EMGVoiceState();
}

class _EMGVoiceState extends State<EMGVoice> {
  final AudioCache cache = AudioCache();
  int count = 0;

  @override
  void initState() {
    super.initState();

    if (Platform.isIOS) {
      if (cache.fixedPlayer != null) {
        cache.fixedPlayer.startHeadlessService();
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0XFF242959),
          title: Text(
            "안전 보이스",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Container(
          child: _myCardTypeList(context),
        ),
      ),
    );
  }



  Widget _myCardTypeList(BuildContext context) {
    final titles = [
      '어디야?',
      '아 너 보인다!',
      '오늘도 범인 한 명 잡았다',
      '사이렌 소리',
      '전화벨 소리',
      '경찰서에서 지금 나왔어, 거기로 가면 돼?',
    ];

    final audios = [
      // "assets/audios/lovetogo.mp3",
      "audios/lovetogo.mp3",
      "audios/lovetogo.mp3",
      "audios/lovetogo.mp3",
      "audios/lovetogo.mp3",
      "audios/lovetogo.mp3",
      "audios/lovetogo.mp3",
    ];

    return ListView.builder(
      itemCount: titles.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            title: Text(titles[index]),
            onTap: () {
                cache.play(audios[index]);
            },
          ),
        );
      },
    );
  }
}