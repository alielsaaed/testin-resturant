import 'package:flutter/material.dart';
import '/Controllers/global-controller.dart';
import '/utils/font_size.dart';
import '/utils/theme_colors.dart';
import 'package:get/get.dart';

class Description extends StatefulWidget {
  final description;
  const Description({required this.description});

  @override
  _DescriptionState createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
  var mainHeight, mainWidth;

  @override
  Widget build(BuildContext context) {
    mainHeight = MediaQuery.of(context).size.height;
    mainWidth = MediaQuery.of(context).size.width;
    return Container(
      height: mainHeight / 6.7,
      padding: EdgeInsets.only(top: 20, left: 15, right: 10, bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "${widget.description.menuItemName}",
            style: TextStyle(
                fontSize: FontSize.large, fontWeight: FontWeight.w900),
            maxLines: 2,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "${widget.description.menuItemDescription}",
            style: TextStyle(
              fontSize: FontSize.xMedium,
              //color: Colors.grey,
              fontWeight: FontWeight.w300,
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(
            height: 10,
          ),
          Divider()
        ],
      ),
    );
  }
}
