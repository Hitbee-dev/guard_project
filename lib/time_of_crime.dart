import 'package:flutter/material.dart';

import 'constants/screen_size.dart';

class TimeOfCrime extends StatefulWidget {
  @override
  _TimeOfCrimeState createState() => _TimeOfCrimeState();
}

class _TimeOfCrimeState extends State<TimeOfCrime> {
  final _yearList = ["연도선택", "2015", "2016", "2017", "2018", "2019"];
  String _selectedYear = "연도선택";

  final crimeHeight = size.height;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.white, //change your color here
          ),
          backgroundColor: Color(0XFF242959),
          title: Text(
            "범죄 발생 시간",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Container(
          color: Colors.white,
          child: Column(
            children: <Widget>[
              _combobox(),
              _mainmap(),
              Expanded(child: Container()),
              _crimeoption()
            ],
          ),
        ),
      ),
    );
  }

  Padding _crimeoption() {
    return Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey[500],
                      ),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30))),
                  child: _crimetexts(),
                ),
              );
  }

  Column _crimetexts() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text("가장 많이 발생한 범죄 : 살인", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)]),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text("가장 많이 발생한 장소 : 단독주택", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)]),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text("가장 많이 발생한 시간대 : 9시 ~ 10시", style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold),)]),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 30),
          child: SingleChildScrollView(
            child: Container(),
          ),
        )
      ],
    );
  }

  Container _combobox() {
    return Container(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 20, top: 20),
        child: DropdownButton(
          iconEnabledColor: Colors.grey,
          iconSize: 20,
          value: _selectedYear,
          items: _yearList.map((value) {
            return DropdownMenuItem(
              value: value,
              child: Text(value, style: TextStyle(fontSize: 15)),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              _selectedYear = value;
            });
          },
        ),
      ),
    );
  }

  Padding _mainmap() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        child: Image.asset("assets/images/crimetime.png"),
      ),
    );
  }
}
