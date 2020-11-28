import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:guard_project/place_crime_rate.dart';
import 'package:guard_project/place_safety_rate.dart';
import 'package:guard_project/time_of_crime.dart';
import 'package:intl/intl.dart';
import 'package:guard_project/real_map.dart';

import 'constants/screen_size.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey();
  static DateTime currentBackPressTime;
  final homeHeight = size.height;

  _isEnd() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      // print(currentBackPressTime);
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
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  _timeofsetcolor(),
                  _btn1(),
                  _btn2(),
                  _mainmap(),
                  SizedBox(
                    height: homeHeight,
                  )
                  // Expanded(flex: 1,child: Container()),
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
              width: 120,
              height: 50,
              alignment: Alignment.center,
              child: Text(
                "내 주위 안심터",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 14),
              ),
            ),
            onPressed: () {
              setState(() {
                Navigator.push(context,
                    MaterialPageRoute<void>(builder: (BuildContext context) {
                  return RealMap();
                }));
              });
            },
          ),
          RaisedButton(
            color: Colors.white,
            child: Container(
              width: 120,
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
            onPressed: () {
              setState(() {
                Navigator.push(context,
                    MaterialPageRoute<void>(builder: (BuildContext context) {
                      return TimeOfCrime();
                    }));
              });
            },
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
            width: 120,
            height: 50,
            alignment: Alignment.center,
            child: Text(
              "지역별 범죄 현황",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 14),
            ),
          ),
          onPressed: () {
            setState(() {
              Navigator.push(context,
                  MaterialPageRoute<void>(builder: (BuildContext context) {
                    return PlaceCrimeRate();
                  }));
            });
          },
        ),
        RaisedButton(
          color: Colors.white,
          child: Container(
            width: 120,
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
          onPressed: () {
            setState(() {
              Navigator.push(context,
                  MaterialPageRoute<void>(builder: (BuildContext context) {
                    return PlaceSafetyRate();
                  }));
            });
          },
        ),
      ],
    );
  }

  Padding _timeofsetcolor() {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('kk').format(now);
    int parsedate = int.parse(formattedDate);
    int check = 0;
    if(parsedate > 8 && parsedate < 20) {
      check = 0;
    } else {
      check = 1;
    }

    final safetyicons = [
      Icons.check_circle,
      Icons.add_circle,
    ];

    final safetytexts = [
      "안전한 시간입니다",
      "위험한 시간입니다"
    ];

    final safetycolors = [
      Colors.green,
      Colors.red
    ];

    print(formattedDate);
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        height: 50,
        width: 400,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            IconButton(
              icon: Icon(safetyicons[check], color: safetycolors[check],),
            ),
            Text(safetytexts[check],
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,color: safetycolors[check]))
          ],
        ),
      ),
    );
  }

  /// 아래 코드는 검색창 + 돋보기 아이콘 안에 넣는 코드
// Padding _search() {
//   return Padding(
//     padding: const EdgeInsets.all(20.0),
//     child: Container(
//       height: 50,
//       width: 400,
//       child: TextFormField(
//         style: TextStyle(fontSize: 18, color: Colors.black),
//         decoration: InputDecoration(
//             focusedBorder: OutlineInputBorder(
//                 borderSide: BorderSide(color: Colors.grey, width: 2.0),
//                 borderRadius: BorderRadius.all(Radius.circular(12))),
//             enabledBorder: OutlineInputBorder(
//                 borderSide: BorderSide(color: Colors.grey, width: 2.0),
//                 borderRadius: BorderRadius.all(Radius.circular(12))),
//             labelText: "검색어를 입력하세요",
//             labelStyle: TextStyle(fontSize: 20, color: Colors.grey),
//             // icon: Icon(Icons.search),
//             // prefixIcon: Icon(Icons.search) // TextField 앞에 아이콘
//             suffixIcon: Icon(Icons.search) // TextField 뒤에 아이콘
//         ),
//         keyboardType: TextInputType.text,
//         onSaved: (String value) {
//           search_data = value;
//         },
//         // controller: _c,
//       ),
//     ),
//   );
// }
}
