import 'package:flutter/material.dart';

import 'constants/screen_size.dart';

class PlaceSafetyRate extends StatefulWidget {
  @override
  _PlaceSafetyRateState createState() => _PlaceSafetyRateState();
}


class _PlaceSafetyRateState extends State<PlaceSafetyRate> {
  final _placeList = ["지역선택", "강남구", "송파구", "강동구", "서초구", "관악구"];
  String _selectedPlace = "지역선택";
  final _yearList = ["연도선택", "2019", "2018", "2017", "2016", "2015"];
  String _selectedYear = "연도선택";

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
            "지역별 안전 지수",
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
                  image: AssetImage(_placeselect()),
                ),
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

  _placeselect() {
    if (_selectedPlace == "지역선택") {
      String setimages = "assets/images/init_safe.png";
      return setimages;
    } else if(_selectedPlace == "강남구") {
      if(_selectedYear == "2015") {
        String setimages = "assets/images/2015_safe.png";
        return setimages;
      } else if(_selectedYear == "2016") {
        String setimages = "assets/images/2016_safe.png";
        return setimages;
      } else if(_selectedYear == "2017") {
        String setimages = "assets/images/2017_safe.png";
        return setimages;
      } else if(_selectedYear == "2018") {
        String setimages = "assets/images/2018_safe.png";
        return setimages;
      } else if(_selectedYear == "2019") {
        String setimages = "assets/images/2019_safe.png";
        return setimages;
      } else {
        String setimages = "assets/images/init_safe.png";
        return setimages;
      }
    } else {
      String setimages = "assets/images/init_safe.png";
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
                      color: _crimechangefontcolor(),
                      fontSize: _crimechangefontsize(),
                      fontWeight: FontWeight.normal),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  _crimechangefontcolor() {
    if (_selectedPlace == "지역선택") {
      Color setcolor = Colors.grey;
      return setcolor;
    } else if(_selectedPlace == "강남구") {
      if(_selectedYear == "2015") {
        Color setcolor = Colors.black;
        return setcolor;
      } else if(_selectedYear == "2016") {
        Color setcolor = Colors.black;
        return setcolor;
      } else if(_selectedYear == "2017") {
        Color setcolor = Colors.black;
        return setcolor;
      } else if(_selectedYear == "2018") {
        Color setcolor = Colors.black;
        return setcolor;
      } else if(_selectedYear == "2019") {
        Color setcolor = Colors.black;
        return setcolor;
      } else {
        Color setcolor = Colors.grey;
        return setcolor;
      }
    } else {
      Color setcolor = Colors.grey;
      return setcolor;
    }
  }

  _crimechangefontsize() {
    if (_selectedPlace == "지역선택") {
      double setsize = 30;
      return setsize;
    } else if(_selectedPlace == "강남구") {
      if(_selectedYear == "2015") {
        double setsize = 18;
        return setsize;
      } else if(_selectedYear == "2016") {
        double setsize = 18;
        return setsize;
      } else if(_selectedYear == "2017") {
        double setsize = 18;
        return setsize;
      } else if(_selectedYear == "2018") {
        double setsize = 18;
        return setsize;
      } else if(_selectedYear == "2019") {
        double setsize = 18;
        return setsize;
      } else {
        double setsize = 30;
        return setsize;
      }
    } else {
      double setsize = 30;
      return setsize;
    }
  }

  _crimechange() {
    if (_selectedPlace == "지역선택") {
      String settext = "\n\n지역과 연도를 선택하세요\n\n";
      return settext;
    } else if(_selectedPlace == "강남구") {
      if(_selectedYear == "2015") {
        String settext =
            "-인구수 581760명\n"
            "-인구밀도 14728(명/km2)\n"
            "-5대 범죄 발생 건수 8617\n"
            "-1만명당 5대 범죄 발생 건수 148.12\n"
            "-스트레스 인지율 37.4\n"
            "-고위험 음주율 15.6\n"
            "-경찰서 및 파출소 25\n"
            "-CCTV대수 3431\n"
            "-1만명당 CCTV대수 58.98";
        return settext;
      } else if(_selectedYear == "2016") {
        String settext =
            "-인구수 572140명\n"
            "-인구밀도 14484(명/km2)\n"
            "-5대 범죄 발생 건수 8149\n"
            "-1만명당 5대 범죄 발생 건수 142.43\n"
            "-스트레스 인지율 33.0\n"
            "-고위험 음주율 13.9\n"
            "-경찰서 및 파출소 26\n"
            "-CCTV대수 4196\n"
            "-1만명당 CCTV대수 73.34";
        return settext;
      } else if(_selectedYear == "2017") {
        String settext =
            "-인구수 561052명\n"
            "-인구밀도 14203(명/km2)\n"
            "-5대 범죄 발생 건수 7720\n"
            "-1만명당 5대 범죄 발생 건수 137.60\n"
            "-스트레스 인지율 25.8\n"
            "-고위험 음주율 11.1\n"
            "-경찰서 및 파출소 26\n"
            "-CCTV대수 4773\n"
            "-1만명당 CCTV대수 85.07";
        return settext;
      } else if(_selectedYear == "2018") {
        String settext =
            "-인구수 547453명\n"
            "-인구밀도 13859(명/km2)\n"
            "-5대 범죄 발생 건수 7513\n"
            "-1만명당 5대 범죄 발생 건수 137.24\n"
            "-스트레스 인지율 31.4\n"
            "-고위험 음주율 15.2\n"
            "-경찰서 및 파출소 25\n"
            "-CCTV대수 5221\n"
            "-1만명당 CCTV대수 95.37";
        return settext;
      } else if(_selectedYear == "2019") {
        String settext =
            "-인구수 550209명\n"
            "-인구밀도 13929(명/km2)\n"
            "-5대 범죄 발생 건수 7304\n"
            "-1만명당 5대 범죄 발생 건수 132.75\n"
            "-스트레스 인지율 28.6\n"
            "-고위험 음주율 13.2\n"
            "-경찰서 및 파출소 23\n"
            "-CCTV대수 5459\n"
            "-1만명당 CCTV대수 99.22";
        return settext;
      } else {
        String settext = "\n\n지역과 연도를 선택하세요\n\n";
        return settext;
      }
    } else {
      String settext = "\n\n지역과 연도를 선택하세요\n\n";
      return settext;
    }
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
