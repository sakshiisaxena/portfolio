import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:web_d/Education_text.dart';

class Edu extends StatefulWidget {
  @override
  _EduState createState() => _EduState();
}

class _EduState extends State<Edu> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return ConstrainedBox(
      constraints: BoxConstraints.tightFor(
        width: size.width,
        height: size.height * 1.4,
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Education & Experience",
                style: TextStyle(
                fontSize: 26.0,
                color: Color(0xffCCD6F6),
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
            ],
          ),
          SizedBox(
            height: size.height * 0.10,
          ),


                Row(
                  children: [
                    Expanded(
                        child: Container(
                          height: size.height * 0.4,
                          child: Edu1(),
                        )),
                    Expanded(
                      child: Container(
                        height: size.height * 0.6,
                        child: Stack(
                          children: [
                            Center(
                              child: VerticalDivider(
                                color: Color(0xff64FFDA),
                                thickness: 1.75,
                                width: 10,
                                indent: 2,
                                endIndent: 2,
                              ),
                            ),
                            Container(
                              child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      CircleAvatar(
                                        backgroundColor: Color(0xffCCD6F6),
                                        child: FaIcon(FontAwesomeIcons.home,
                                            color: Colors.black),
                                      ),
                                      CircleAvatar(
                                        backgroundColor: Color(0xffCCD6F6),
                                        child: FaIcon(FontAwesomeIcons.university,
                                            color: Colors.black),
                                      ),
                                    ],
                                  )),
                            )
                          ],
                        )),
                ),
                    Expanded(
                        child: Container(
                          height: size.height * 0.4,
                          child: Edu2(),
                        )),
              ],
            ),

          Row(
            children: [
              Expanded(
                  child: Container(
                    height: size.height * 0.4,
                    child: Edu3(),
                  )),
              Expanded(
                child: Container(
                    height: size.height * 0.6,
                    child: Stack(
                      children: [
                        Center(
                          child: VerticalDivider(
                            color: Color(0xff64FFDA),
                            thickness: 1.75,
                            width: 10,
                            indent: 2,
                            endIndent: 2,
                          ),
                        ),
                        Container(
                          child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Color(0xffCCD6F6),
                                    child: FaIcon(FontAwesomeIcons.blogger,
                                        color: Colors.black),
                                  ),
                                  CircleAvatar(
                                    backgroundColor: Color(0xffCCD6F6),
                                    child: FaIcon(FontAwesomeIcons.crown,
                                        color: Colors.black),
                                  ),
                                ],
                              )),
                        )
                      ],
                    )),
              ),
              Expanded(
                  child: Container(
                    height: size.height * 0.4,
                    child: Edu4(),
                  )),
            ],
          ),

        ],
      ),
    );
  }
}
