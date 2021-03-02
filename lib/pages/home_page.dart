import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:uber_eats_flutter/json/home_page_json.dart';

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
                  }))
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
    ),
  );
}
