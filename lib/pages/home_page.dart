import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
              SizedBox(height: 15),
              Container(
                  width: size.width,
                  child: Padding(
                    padding: EdgeInsets.only(left: 15, right: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            Container(
                              width: size.width,
                              height: 160,
                              child: Image(
                                  image: NetworkImage(firstMenu[0]['img']),
                                  fit: BoxFit.cover),
                            ),
                            Positioned(
                                bottom: 15,
                                right: 15,
                                child: SvgPicture.asset(
                                    firstMenu[0]['is_liked']
                                        ? "assets/images/loved_icon.svg"
                                        : "assets/images/love_icon.svg",
                                    width: 20,
                                    color: Colors.white)),
                          ],
                        ),
                        SizedBox(height: 15),
                        Text(firstMenu[0]['name'],
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w400)),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Text("Sponsored",
                                style: TextStyle(
                                  fontSize: 14,
                                )),
                            SizedBox(
                              width: 5,
                            ),
                            Icon(Icons.info, size: 15, color: Colors.grey),
                          ],
                        ),
                        SizedBox(height: 8),
                        Text(firstMenu[0]['description'],
                            style: TextStyle(fontSize: 14)),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Container(
                                decoration: BoxDecoration(
                                    color: textFieldColor,
                                    borderRadius: BorderRadius.circular(3)),
                                child: Padding(
                                  padding: EdgeInsets.all(3),
                                  child: Icon(
                                    Icons.hourglass_bottom,
                                    size: 16,
                                  ),
                                )),
                            SizedBox(width: 8),
                            Container(
                              decoration: BoxDecoration(
                                color: textFieldColor,
                                borderRadius: BorderRadius.circular(3),
                              ),
                              child: Padding(
                                  padding: EdgeInsets.all(5),
                                  child: Text(firstMenu[0]['time'],
                                      style: TextStyle(
                                        fontSize: 14,
                                      ))),
                            ),
                            SizedBox(width: 8),
                            Container(
                              decoration: BoxDecoration(
                                color: textFieldColor,
                                borderRadius: BorderRadius.circular(3),
                              ),
                              child: Padding(
                                  padding: EdgeInsets.all(5),
                                  child: Text(firstMenu[0]['delivery_fee'],
                                      style: TextStyle(
                                        fontSize: 14,
                                      ))),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )),
              SizedBox(height: 15),
              Container(
                width: size.width,
                height: 10,
                decoration: BoxDecoration(
                  color: textFieldColor,
                ),
              ),
              SizedBox(height: 20),
              Container(
                margin: EdgeInsets.only(left: 15, right: 15, bottom: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "More to explore",
                      style: customTitle,
                    ),
                    SizedBox(height: 15),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                          children: List.generate(exploreMenu.length, (index) {
                        return getItemsMenu(size, exploreMenu, index);
                      })),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),
              Container(
                width: size.width,
                height: 10,
                decoration: BoxDecoration(
                  color: textFieldColor,
                ),
              ),
              SizedBox(height: 20),
              Container(
                margin: EdgeInsets.only(left: 15, right: 15, bottom: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Popular Near You",
                      style: customTitle,
                    ),
                    SizedBox(height: 15),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                          children:
                              List.generate(popluarNearYou.length, (index) {
                        return getItemsMenu(size, popluarNearYou, index);
                      })),
                    ),
                  ],
                ),
              )
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

Widget getItemsMenu(var size, var json, var index) {
  return Padding(
    padding: const EdgeInsets.only(right: 15),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Container(
              width: size.width,
              height: 160,
              child: Image(
                  image: NetworkImage(json[index]['img']), fit: BoxFit.cover),
            ),
            Positioned(
                bottom: 15,
                right: 15,
                child: SvgPicture.asset(
                    json[index]['is_liked']
                        ? "assets/images/loved_icon.svg"
                        : "assets/images/love_icon.svg",
                    width: 20,
                    color: Colors.white)),
          ],
        ),
        SizedBox(height: 15),
        Text(json[index]['name'],
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
        SizedBox(height: 8),
        Row(
          children: [
            Text("Sponsored",
                style: TextStyle(
                  fontSize: 14,
                )),
            SizedBox(
              width: 5,
            ),
            Icon(Icons.info, size: 15, color: Colors.grey),
          ],
        ),
        SizedBox(height: 8),
        Text(json[index]['description'], style: TextStyle(fontSize: 14)),
        SizedBox(height: 8),
        Row(
          children: [
            Container(
                decoration: BoxDecoration(
                    color: textFieldColor,
                    borderRadius: BorderRadius.circular(3)),
                child: Padding(
                  padding: EdgeInsets.all(3),
                  child: Icon(
                    Icons.hourglass_bottom,
                    size: 16,
                  ),
                )),
            SizedBox(width: 8),
            Container(
              decoration: BoxDecoration(
                color: textFieldColor,
                borderRadius: BorderRadius.circular(3),
              ),
              child: Padding(
                  padding: EdgeInsets.all(5),
                  child: Text(json[index]['time'],
                      style: TextStyle(
                        fontSize: 14,
                      ))),
            ),
            SizedBox(width: 8),
            Container(
              decoration: BoxDecoration(
                color: textFieldColor,
                borderRadius: BorderRadius.circular(3),
              ),
              child: Padding(
                padding: EdgeInsets.all(5),
                child: Row(
                  children: [
                    Text(json[index]['rate'],
                        style: TextStyle(
                          fontSize: 14,
                        )),
                    SizedBox(width: 3),
                    Icon(Icons.star, color: yellowStar, size: 17),
                    SizedBox(width: 3),
                    Text(json[index]['rate_number'],
                        style: TextStyle(
                          fontSize: 14,
                        )),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
