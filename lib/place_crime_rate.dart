import 'package:flutter/material.dart';

import 'constants/screen_size.dart';

class PlaceCrimeRate extends StatefulWidget {
  @override
  _PlaceCrimeRateState createState() => _PlaceCrimeRateState();
}

class _PlaceCrimeRateState extends State<PlaceCrimeRate> {
  final _placeList = ["지역선택", "강남구", "송파구", "강동구", "서초구", "관악구"];
  String _selectedPlace = "지역선택";
  final _yearList = ["연도선택", "2015", "2016", "2017", "2018", "2019"];
  String _selectedYear = "연도선택";

  final crimeWidth = size.width;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.white, //change your color here
          ),
          backgroundColor: Color(0XFF242959),
          title: Text(
            "지역별 범죄 현황",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                  alignment: Alignment.topCenter,
                  image: AssetImage("assets/images/placecrimerate.png"),
                )
            ),
            // color: Colors.white,
            child: Column(
              children: <Widget>[
                _placecombobox(),
                _yearcombobox(),
                Expanded(child: Container()),
                _crimeoption()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container _crimeoption() {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey[500],
          ),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30))),
      child: _crimetexts(),
    );
  }

  Padding _crimetexts() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 90),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 100),
                child: Text("지역을 선택하세요.",
                  style: TextStyle(
                    color: Colors.grey,
                      fontSize: 34,
                      fontWeight: FontWeight.normal),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Container _placecombobox() {
    return Container(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: DropdownButton(
          iconEnabledColor: Colors.grey,
          iconSize: 20,
          value: _selectedPlace,
          items: _placeList.map((value) {
            return DropdownMenuItem(
              value: value,
              child: Text(value, style: TextStyle(fontSize: 15)),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              _selectedPlace = value;
            });
          },
        ),
      ),
    );
  }

  Container _yearcombobox() {
    return Container(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 20),
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
}
