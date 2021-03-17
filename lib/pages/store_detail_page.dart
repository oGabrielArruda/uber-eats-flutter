import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:line_icons/line_icons.dart';
import 'package:uber_eats_flutter/json/home_page_json.dart';
import 'package:uber_eats_flutter/theme/colors.dart';
import 'package:uber_eats_flutter/theme/styles.dart';

class StoreDetailPage extends StatefulWidget {
  final String img;

  StoreDetailPage(this.img);

  @override
  _StoreDetailPageState createState() => _StoreDetailPageState();
}

class _StoreDetailPageState extends State<StoreDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: getFooter(),
      body: getBody(),
    );
  }

  Widget getFooter() {
    var size = MediaQuery.of(context).size;
    return Container(
      height: 80,
      width: size.width,
      decoration: BoxDecoration(
          color: white,
          border: Border(top: BorderSide(color: black.withOpacity(0.1)))),
      child: Padding(
        padding: EdgeInsets.only(top: 15),
        child: Column(
          children: [
            Text("\$15.00 away from a \$0.00 delivery fee.",
                style: TextStyle(
                    fontSize: 14, fontWeight: FontWeight.w500, color: primary)),
          ],
        ),
      ),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(bottom: 60),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                    width: size.width,
                    height: 200,
                    child: Image(
                      image: NetworkImage(widget.img),
                      fit: BoxFit.cover,
                    )),
                SafeArea(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: white,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Icon(Icons.arrow_back, size: 18),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      IconButton(
                        icon: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: white,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Icon(Icons.favorite_border, size: 18),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Starbucks (Park Row at Beekman St)",
                      style:
                          TextStyle(fontSize: 21, fontWeight: FontWeight.bold)),
                  SizedBox(height: 15),
                  Row(
                    children: [
                      Container(
                        width: size.width - 30,
                        child: Text(
                            "Cafe - Coffe & Tea = Breakfast and Brunch - Bakery \$",
                            style: TextStyle(fontSize: 14, height: 1.3)),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
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
                            child: Text("40 - 50 Min",
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
                              Text("4.7",
                                  style: TextStyle(
                                    fontSize: 14,
                                  )),
                              SizedBox(width: 3),
                              Icon(Icons.star, color: yellowStar, size: 17),
                              SizedBox(width: 3),
                              Text("16",
                                  style: TextStyle(
                                    fontSize: 14,
                                  )),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 15),
                  Divider(color: black.withOpacity(0.3)),
                  SizedBox(height: 10),
                  Text(
                    "Store Info",
                    style: customContent,
                  ),
                  SizedBox(height: 15),
                  Row(
                    children: [
                      Container(
                        width: size.width * 0.8,
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              "assets/images/pin_icon.svg",
                              width: 15,
                              color: black.withOpacity(0.5),
                            ),
                            SizedBox(width: 8),
                            Text("38 Park Row Frnt 4, New York, NY 1003",
                                style: TextStyle(
                                  fontSize: 14,
                                )),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Text("More Info",
                            style: TextStyle(
                                fontSize: 14,
                                color: primary,
                                fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    children: [
                      Icon(LineIcons.comment, size: 15, color: primary),
                      SizedBox(width: 8),
                      Text("People say...",
                          style: TextStyle(
                              fontSize: 14, color: black.withOpacity(0.5))),
                    ],
                  ),
                  SizedBox(height: 15),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                        children: List.generate(
                      peopleFeedback.length,
                      (index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 15.0),
                          child: Container(
                            height: 40,
                            decoration: BoxDecoration(
                                color: primary.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(30)),
                            child: Center(
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 15, right: 15),
                                child: Text(peopleFeedback[index],
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: primary,
                                      fontWeight: FontWeight.w500,
                                    )),
                              ),
                            ),
                          ),
                        );
                      },
                    )),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
