import 'package:flutter/material.dart';
import 'package:uber_eats_flutter/theme/colors.dart';

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
}
