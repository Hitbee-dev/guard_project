import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0XFF242959),
          title: Text(
            "알림",
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
}

Widget _myCardTypeList(BuildContext context) {
  final titles = [
    '버전 업데이트가 완료되었습니다.',
    '새로운 뉴스가 업로드 되었습니다.',
  ];
  final icons = [
    Icons.check_circle_outline,
    Icons.fiber_new,
  ];
  final colors = [
    Colors.green,
    Colors.blueAccent,
  ];
  return ListView.builder(
    itemCount: titles.length,
    itemBuilder: (context, index) {
      return Card(
        child: ListTile(
          leading: Icon(icons[index], color: colors[index]),
          title: Text(titles[index], style: TextStyle(fontWeight: FontWeight.bold),),
          onTap: () {},
        ),
      );
    },
  );
}