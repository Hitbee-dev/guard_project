import 'package:flutter/material.dart';

class EMGVoice extends StatelessWidget {
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

    return ListView.builder(
      itemCount: titles.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            title: Text(titles[index]),
            onTap: () {},
          ),
        );
      },
    );
  }
}