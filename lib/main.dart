import 'package:flutter/material.dart';
import 'package:guard_project/bottom_bar.dart';
import 'package:provider/provider.dart';
import 'constants/material_white.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  /// StatelessWidget = 화면의 움직임이 없을 때
  /// StatefulWidget = 화면의 움직임이 있을 때
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //Debug 표시를 보이지 않음
      home: BottomBar(),
      /// Refactor 이용해서 Scaffold 분리
      /// 다른 파일을 불러오기 위해 homepage.dart를 import 해준다
      theme: ThemeData(primarySwatch: white),

      /// Material Color가 아니기 때문에 Color를 따로 지정 해 주어야 한다
    );
  }
}
