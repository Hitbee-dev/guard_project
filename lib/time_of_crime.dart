import 'package:flutter/material.dart';

import 'constants/screen_size.dart';

class TimeOfCrime extends StatefulWidget {
  @override
  _TimeOfCrimeState createState() => _TimeOfCrimeState();
}


class _TimeOfCrimeState extends State<TimeOfCrime> {
  final _yearList = ["2019", "2018", "2017", "2016", "2015"];
  String _selectedYear = "2019";

  final crimeWidth = size.width;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

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
            "범죄 발생 시간",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Container(
            // decoration: BoxDecoration(
            //   image: DecorationImage(
            //     alignment: Alignment.topCenter,
            //     image: AssetImage(_placeselect()),
            //   ),
            // ),
            // color: Colors.white,
            child: Column(
              children: <Widget>[
                _yearcombobox(),
                Image.asset(_placeselect()),
                Expanded(child: Container()),
                _crimeoption()
              ],
            ),
          ),
        ),
      ),
    );
  }

  _placeselect() {
    if (_selectedYear == "2015") {
      String setimages = "assets/images/2015_time.png";
      return setimages;
    } else if (_selectedYear == "2016") {
      String setimages = "assets/images/2016_time.png";
      return setimages;
    } else if (_selectedYear == "2017") {
      String setimages = "assets/images/2017_time.png";
      return setimages;
    } else if (_selectedYear == "2018") {
      String setimages = "assets/images/2018_time.png";
      return setimages;
    } else if (_selectedYear == "2019") {
      String setimages = "assets/images/2019_time.png";
      return setimages;
    }
  }

  Widget _crimeoption() {
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

  Widget _crimetexts() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 40),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Text(_crimechange(),
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  _crimechange() {
      if (_selectedYear == "2015") {
        String settext =
            "\n가장 많이 발생한 범죄 : 폭력\n\n"
            "가장 많이 발생한 장소 : 단독주택\n\n"
            "가장 많이 발생한 시간대 : 21:00~23:59\n";
        return settext;
      } else if (_selectedYear == "2016") {
        String settext =
            "\n가장 많이 발생한 범죄 : 절도\n\n"
            "가장 많이 발생한 장소 : 상점\n\n"
            "가장 많이 발생한 시간대 : 18:00~20:59\n";
        return settext;
      } else if (_selectedYear == "2017") {
        String settext =
            "\n가장 많이 발생한 범죄 : 폭력\n\n"
            "가장 많이 발생한 장소 : 상점\n\n"
            "가장 많이 발생한 시간대 : 03:00~05:59\n";
        return settext;
      } else if (_selectedYear == "2018") {
        String settext =
            "\n가장 많이 발생한 범죄 : 절도\n\n"
            "가장 많이 발생한 장소 : 상점\n\n"
            "가장 많이 발생한 시간대 : 03:00~05:59\n";
        return settext;
      } else if (_selectedYear == "2019") {
        String settext =
            "\n가장 많이 발생한 범죄 : 절도\n\n"
            "가장 많이 발생한 장소 : 상점\n\n"
            "가장 많이 발생한 시간대 : 21:00~23:59\n";
        return settext;
      }
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
