import 'package:flutter/material.dart';

class CustomInformation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0XFF242959),
          title: Text(
            "호신술 정보",
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
    '기억해야 할 급소',
    '가장 쉽고 효과적인 대응법',
    '정면에서 붙잡힌다면',
    '손을 빼는 방법',
    '뒤에서 붙잡힌다면',
    '옆쪽으로 다가온다면',
  ];
  final icons = [
    Icons.accessibility_new,
    Icons.check,
    Icons.location_searching,
    Icons.call_missed,
    Icons.settings_backup_restore,
    Icons.accessible_forward,
  ];

  final images = [
    "assets/images/information001.png",
    "assets/images/information002.png",
    "assets/images/information003.png",
    "assets/images/information004.png",
    "assets/images/information005.png",
    "assets/images/information006.png",
  ];

  return ListView.builder(
    itemCount: titles.length,
    itemBuilder: (context, index) {
      return Card(
        child: ListTile(
          leading: Icon(icons[index]),
          title: Text(titles[index]),
          onTap: () {
            showDialog(
                context: context,
                builder: (BuildContext context){
                  return AlertDialog(
                    title: Text(titles[index]),
                    content: Image.asset(images[index])
                  );
                }
            );
          },
        ),
      );
    },
  );
}
