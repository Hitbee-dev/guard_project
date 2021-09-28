import 'package:flutter/material.dart';

class Information extends StatelessWidget {
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
          child: _ItemList(context),
        ),
      ),
    );
  }

  ListView _ItemList(BuildContext context) {
    return ListView(
          children: ListTile.divideTiles(context: context, tiles: [
            ListTile(
              leading: Icon(Icons.accessibility_new),
              title: Text(
                "기억해야 할 남자의 급소",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
              ),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.check),
              title: Text(
                "가장 쉽고 효과적인 대응법",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
              ),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.location_searching),
              title: Text(
                "정면에서 붙잡힌다면",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
              ),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.call_missed),
              title: Text(
                "손을 빼는 방법",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
              ),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.settings_backup_restore),
              title: Text(
                "뒤에서 붙잡힌다면",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
              ),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.accessible_forward),
              title: Text(
                "옆쪽으로 다가온다면",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
              ),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {},
            ),
          ]).toList(),
          /// toList()를 추가함으로서 List별 경계선이 생김
        );
  }
}
