import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:web_d/Project_text.dart';

class Project extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width:size.width - 100,
      child: Row(
        children: [
          Container(
            height: size.height * 0.8,
            width: size.width / 2 - 100,
            child: Column(
              children: [
                Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[

                      Text(
                        "Things I've built",
                        style: TextStyle(
                          color: Color(0xffCCD6F6),
                          fontSize: 26.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.01,
                      ),
                      Container(
                        width: size.width / 4,
                        height: 1.10,
                        color: Color(0xff939baa),
                      ),
                    ]
                ),

              ],
            ),
          )

        ],
      ),
    );
  }
}
