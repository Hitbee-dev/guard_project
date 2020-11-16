import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:guard_project/real_map.dart';

import 'constants/screen_size.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey();
  static DateTime currentBackPressTime;

  _isEnd() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      _globalKey.currentState
        ..hideCurrentSnackBar()
        ..showSnackBar(SnackBar(
          duration: Duration(seconds: 2),
          content: Text("종료하시려면 한번 더 누르세요."),
        ));
      return false;
    }
    return true;
  }
  /// BackButton 연속 2번 누를 시 종료 Event

  String search_data = "";

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.black));

    /// 상태바 색상 변경
    if (size == null) size = MediaQuery.of(context).size;

    return WillPopScope(
      onWillPop: () async {
        bool result = _isEnd();
        return await Future.value(result);
      },
      child: Scaffold(
        key: _globalKey,
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.grey,
        appBar: AppBar(
          backgroundColor: Color(0XFF242959),
          title: Text(
            "지역 안전 지킴e",
            style:
                TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Column(
                children: [
                  _search(),
                  _btn1(),
                  _btn2(),
                  _mainmap(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Padding _mainmap() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        child: Image.asset("assets/images/mainmap.png"),
      ),
    );
  }

  Padding _btn2() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          RaisedButton(
            color: Colors.white,
            child: Container(
              width: 100,
              height: 50,
              alignment: Alignment.center,
              child: Text(
                "현 위치",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 14),
              ),
            ),
            onPressed: () {
              setState(() {
                return RealMap();
              });
            },
          ),
          RaisedButton(
            color: Colors.white,
            child: Container(
              width: 100,
              height: 50,
              alignment: Alignment.center,
              child: Text(
                "범죄 발생 시간",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 14),
              ),
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Row _btn1() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        RaisedButton(
          color: Colors.white,
          child: Container(
            width: 100,
            height: 50,
            alignment: Alignment.center,
            child: Text(
              "지역별 현황",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 14),
            ),
          ),
          onPressed: () {},
        ),
        RaisedButton(
          color: Colors.white,
          child: Container(
            width: 100,
            height: 50,
            alignment: Alignment.center,
            child: Text(
              "지역별 안전 지수",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 14),
            ),
          ),
          onPressed: () {},
        ),
      ],
    );
  }

  Padding _search() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        height: 50,
        width: 400,
        child: TextFormField(
          style: TextStyle(fontSize: 18, color: Colors.black),
          decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 2.0),
                  borderRadius: BorderRadius.all(Radius.circular(12))),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 2.0),
                  borderRadius: BorderRadius.all(Radius.circular(12))),
              labelText: "검색어를 입력하세요",
              labelStyle: TextStyle(fontSize: 20, color: Colors.grey),
              // icon: Icon(Icons.search),
              // prefixIcon: Icon(Icons.search) // TextField 앞에 아이콘
              suffixIcon: Icon(Icons.search) // TextField 뒤에 아이콘
              ),
          keyboardType: TextInputType.text,
          onSaved: (String value) {
            search_data = value;
          },
          // controller: _c,
        ),
      ),
    );
  }
}
