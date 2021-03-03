import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uber_eats_flutter/json/home_page_json.dart';
import 'package:uber_eats_flutter/theme/colors.dart';
import 'package:uber_eats_flutter/theme/styles.dart';
import 'package:uber_eats_flutter/widgets/custom_slider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int activeMenu = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
    );
  }

  Widget getBody() {
    {
      var size = MediaQuery.of(context).size;
      return ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 15,
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(menu.length, (index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            activeMenu = index;
                          });
                        },
                        child: activeMenu == index
                            ? ElasticIn(
                                child: getNavItem(
                                    index, Colors.black, Colors.white))
                            : getNavItem(
                                index, Colors.transparent, Colors.black),
                      ),
                    );
                  })),
              SizedBox(height: 15),
              getFilterCities(size),
              SizedBox(height: 15),
              CustomSliderWidget(
                items: [
                  "assets/images/slide_1.jpg",
                  "assets/images/slide_2.jpg",
                  "assets/images/slide_3.jpg",
                ],
              ),
              getCategories(size),
            ],
          )
        ],
      );
    }
  }
}

Widget getNavItem(int i, Color boxColor, Color textColor) {
  return Container(
    decoration: BoxDecoration(
      color: boxColor,
      borderRadius: BorderRadius.circular(30),
    ),
    child: Padding(
        padding: EdgeInsets.only(left: 15, right: 15, bottom: 8, top: 8),
        child: Row(
          children: [
            Text(menu[i],
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: textColor))
          ],
        )),
  );
}

Widget getFilterCities(var size) {
  return Row(
    children: [
      Container(
        margin: EdgeInsets.only(left: 15),
        height: 45,
        width: size.width - 70,
        decoration: BoxDecoration(
          color: textFieldColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.all(12),
              child: Row(
                children: [
                  SvgPicture.asset("assets/images/pin_icon.svg", width: 20),
                  SizedBox(width: 5),
                  Text("New York", style: customContent)
                ],
              ),
            ),
            Padding(
                padding: EdgeInsets.all(5),
                child: Container(
                  height: 35,
                  decoration: BoxDecoration(
                      color: white, borderRadius: BorderRadius.circular(30)),
                  child: Padding(
                    padding: EdgeInsets.only(left: 15, right: 15),
                    child: Row(
                      children: [
                        SvgPicture.asset("assets/images/time_icon.svg",
                            width: 20),
                        SizedBox(width: 8),
                        Text(
                          "Now",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 2),
                        Icon(Icons.keyboard_arrow_down)
                      ],
                    ),
                  ),
                )),
          ],
        ),
      ),
      Expanded(
        child: Container(
          child: SvgPicture.asset("assets/images/filter_icon.svg"),
        ),
      ),
    ],
  );
}

Widget getCategories(var size) {
  return Container(
    width: size.width,
    decoration: BoxDecoration(color: textFieldColor),
    child: Padding(
      padding: EdgeInsets.only(bottom: 10, top: 10),
      child: Container(
          decoration: BoxDecoration(color: white),
          child: Padding(
            padding: EdgeInsets.only(top: 15, bottom: 15),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                margin: EdgeInsets.only(left: 30),
                child: Row(
                    children: List.generate(categories.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 30),
                    child: Column(
                      children: [
                        SvgPicture.asset(categories[index]['img'], width: 40),
                        SizedBox(height: 15),
                        Text(categories[index]['name'], style: customContent)
                      ],
                    ),
                  );
                })),
              ),
            ),
          )),
    ),
  );
}
