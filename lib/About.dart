import 'package:flutter/material.dart';


class About extends StatelessWidget {

  Widget technology(BuildContext context, String text) {
    return Row(
      children: [
        Icon(
          Icons.arrow_forward_ios_sharp,
          color: Color(0xff64FFDA).withOpacity(0.6),
          size: 14.0,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.01,
        ),
        Text(
          text,
          style: TextStyle(
            color: Color(0xffCCD6F6),
            letterSpacing: 1.75,
            height: 2,
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width:size.width - 100,
      child: Row(
        children: [
          //About me
          Container(
            height: size.height * 0.8,
            width: size.width / 2 - 100,
            child: Column(
              children: [
                //About me title
                Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[

                    Text(
                      "About Me",
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

                SizedBox(
                  height: size.height * 0.07,
                ),

                //About me desc
                Wrap(
                  children: [
                    Text(
                      "Hey! I'm Sakshi, currently living in Lucknow. \n\n",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      "Currently, I am pursuing my Bachelor's degree in Electronics & Communication Engineering at Banasthali University, as well as learning various technical stuff and make meaningful projects.\n\n",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      "Here are a few technologies I've been working with recently:\n\n",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),

                Container(
                  height: size.height * 0.15,
                  width: size.width,
                  child: Wrap(
                    children: [
                      Container(
                        width: size.width * 0.20,
                        height: size.height * 0.15,
                        child: Column(
                          children: [
                            technology(context, "Dart"),
                            technology(context, "Flutter"),
                            technology(context, "Firebase"),
                          ],
                        ),
                      ),
                      Container(
                        width: size.width * 0.20,
                        height: size.height * 0.15,
                        child: Column(
                          children: [
                            technology(context, "C/C++, Java."),
                            technology(context, "HTML & CSS"),
                            technology(context, "Git - Github"),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),

          //Profile Image
          Expanded(
            child: Container(
              height: size.height / 1.5,
              width: size.width / 2 - 100,
              // color: Colors.white,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    top: size.height * 0.12,
                    left: size.width * 0.120,
                    child: Card(
                      color: Color(0xff8e638c),
                      child: Container(
                        margin: EdgeInsets.all(2.75),
                        height: size.height / 2,
                        width: size.width / 5,
                        color: Color(0xffac9da3),
                      ),
                    ),
                  ),
                  //CustomImageAnimation()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


