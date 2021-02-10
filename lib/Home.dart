import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:web_d/About.dart';
import 'package:web_d/AppBarTitle.dart';
import 'package:web_d/Education.dart';
import 'package:web_d/Method.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:web_d/Project.dart';
import 'package:web_d/Project_text.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String description = "A 19 year old sophomore balancing between flutter and life. ";

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Method method = Method();
  AutoScrollController _autoScrollController;
  final scrollDirection = Axis.vertical;

  bool isExpaned = true;

  bool get _isAppBarExpanded {
    return _autoScrollController.hasClients &&
        _autoScrollController.offset > (120 - kToolbarHeight);
  }

  @override
  void initState() {
    _autoScrollController = AutoScrollController(
      viewportBoundaryGetter: () =>
          Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom),
      axis: scrollDirection,
    )..addListener(
          () => _isAppBarExpanded
          ? isExpaned != false
          ? setState(
            () {
          isExpaned = false;
          print('setState is called');
        },
      )
          : {}
          : isExpaned != true
          ? setState(() {
        print('setState is called');
        isExpaned = true;
      })
          : {},
    );
    super.initState();
  }


  Future _scrollToIndex(int index) async {
    await _autoScrollController.scrollToIndex(index,
        preferPosition: AutoScrollPosition.begin);
    _autoScrollController.highlight(index);
  }

  Widget _wrapScrollTag({int index, Widget child}) {
    return AutoScrollTag(
      key: ValueKey(index),
      controller: _autoScrollController,
      index: index,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
    primary: true,
    scrollDirection: Axis.vertical,
            child: Container(
            alignment: Alignment.center,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              //colors: [const Color(0xffff512F), const Color(0xffDD2476)],
              colors: [const Color(0xff780206), const Color(0xff061161)],
        )
      ),

          child: Column(
            children: <Widget>[
              Container(
                height: size.height * 0.14,
                width: size.width,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [

                      SizedBox(width: 10.0),

                    Padding(
                        padding: const EdgeInsets.only(left:0.0, right: 0.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            /*IconButton(
                                icon: Icon(
                                  Icons.search_rounded,
                                  size: 25.0,
                                  color: Color(0xffCCD6F6),
                                ),
                                onPressed: () {}),
                            Padding(
                              padding: const EdgeInsets.only(top: 16.0),
                              child: Container(
                                height: 2,
                                width: size.height * 0.18,
                                color: Colors.grey.withOpacity(0.4),
                              ),
                            ),*/
                        ]
                        )),
                        Spacer(),
                        Expanded(
                         child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: DefaultTabController(
                            length: 5,
                            child: TabBar(
                              indicatorColor: Colors.transparent,
                              onTap: (index) async {
                                _scrollToIndex(index);
                              },
                              tabs: [
                                Tab(
                                  child: AppBarTitle(
                                    text: 'About',
                                  ),
                                ),
                                Tab(
                                  child: AppBarTitle(
                                    text: 'Education',
                                  ),
                                ),
                                Tab(
                                  child: AppBarTitle(
                                    text: 'Projects',
                                  ),
                                ),
                                Tab(
                                  child: AppBarTitle(
                                    text: 'Contact',
                                  ),
                                ),
                                MaterialButton(
                                  onPressed: () async {
                                    _launchURL("https://drive.google.com/file/d/1rz1dfgHvXOGJgtaZUrJeJC9aI1t7e6_x/view?usp=sharing");
                                  },
                                  child: AppBarTitle(
                                    text: 'Resume',
                                  ),
                                  //color: Colors.pink,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

                Row(
                    children: [
                      //Social Icon
                      Container(
                        width: size.width * 0.09,
                        height: size.height - 82,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            /*Padding(
                              padding: const EdgeInsets.only(top: 16.0),
                              child: Container(
                                height: size.height * 0.20,
                                width: 2,
                                color: Colors.grey.withOpacity(0.4),
                              ),
                            ),*/
                            IconButton(
                                icon: FaIcon(FontAwesomeIcons.twitter),
                                color: Color(0xffffA8B2D1),
                                iconSize: 16.0,
                                onPressed: () {
                                  _launchURL("https://twitter.com/sakshiEmpowers");
                                }),
                            IconButton(
                                icon: FaIcon(FontAwesomeIcons.instagram),
                                color: Color(0xffffA8B2D1),
                                iconSize: 16.0,
                                onPressed: () {
                                  _launchURL("https://www.instagram.com/_sakshisaxena/?hl=en");
                                }),
                            IconButton(
                                icon: FaIcon(FontAwesomeIcons.facebook),
                                color: Color(0xffffA8B2D1),
                                iconSize: 16.0,
                                onPressed: () {
                                  _launchURL("https://www.facebook.com/sakshi.saxena.370/");
                                }),
                            IconButton(
                              icon: FaIcon(FontAwesomeIcons.linkedin),
                              color: Color(0xffffA8B2D1),
                              onPressed: () {
                                _launchURL("https://www.linkedin.com/in/sakshi-saxena-356717186/");
                              },
                              iconSize: 16.0,
                            ),
                            IconButton(
                                icon: FaIcon(FontAwesomeIcons.github),
                                color: Color(0xffffA8B2D1),
                                iconSize: 16.0,
                                onPressed: () {
                                  _launchURL("https://github.com/sakshiisaxena");
                                }),
                            IconButton(
                                icon: Icon(Icons.call),
                                color: Color(0xffffA8B2D1),
                                iconSize: 16.0,
                                onPressed: () {
                                  method.launchCaller();
                                }),
                            IconButton(
                                icon: Icon(Icons.mail),
                                color: Color(0xffffA8B2D1),
                                iconSize: 16.0,
                                onPressed: () {
                                  method.launchEmail();
                                }),
                            /*Padding(
                              padding: const EdgeInsets.only(top: 16.0),
                              child: Container(
                                height: size.height * 0.20,
                                width: 2,
                                color: Colors.grey.withOpacity(0.4),
                              ),
                            ),*/
                          ],
                        ),
                      ),

                      Expanded(
                        child: Container(
                        height: size.height - 82,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: CustomScrollView(
                          controller: _autoScrollController,
                            slivers: <Widget>[
                           SliverList(
                            delegate: SliverChildListDelegate([
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                             SizedBox(
                               height: size.height * .13,
                              ),
                                              ClipRRect(
                                                  borderRadius: BorderRadius.all(Radius.circular(80)),
                                                  child: Image.asset(
                                                    "images/sakshi.jpeg",
                                                    width: 150,
                                                    height: 150,
                                                  )
                                              ),

                                            SizedBox(
                                              height: 50,
                                            ),
                                      Text(
                                        "Sakshi Saxena",
                                        style: TextStyle(
                                            color: Color(0xffCCD6F6),
                                            fontWeight: FontWeight.w900,
                                            fontSize: 68,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 13,
                                      ),
                                      Container(
                                        padding: EdgeInsets.symmetric(horizontal: 50),
                                        child: Text(
                                          description,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Color(0xffCCD6F6).withOpacity(0.6),
                                              fontWeight: FontWeight.w700,
                                              fontSize: 30,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 220.0,
                                      ),
                                ]),


                                _wrapScrollTag(
                                  index: 0,
                                  child: About(),
                                ),
                                SizedBox(height: size.height * 0.02,),

                                _wrapScrollTag(
                                 index: 1,
                                  child: Edu(),
                                ),
                                SizedBox(height: size.height * 0.04,),

                                _wrapScrollTag(
                                    index: 2,
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
                                         Project_text(
                                          imagePath: "images/pic1.jpg",
                                          ontab: () {
                                            _launchURL(
                                                "https://github.com/sakshiisaxena/flutter_flight_app");
                                          },
                                          projectDesc:
                                          "A flight booking app UI in flutter. The purpose of this projcet is to Learn the concepts of lists and buttons along with flutter UI.",
                                          projectTitle: "Flight Booking App",
                                          tech1: "Flutter",
                                          tech2: "Dart",
                                          tech3: "Flutter UI",
                                        ),

                                        Project_text(
                                          imagePath: "images/pic2.jpg",
                                          ontab: () {
                                            method.launchURL(
                                                "https://github.com/sakshiisaxena/funccforce_app_init");
                                          },
                                          projectDesc:
                                          "A log in and sign up page using Firebase authentication. The purpose of this project is to learn firebase",
                                          projectTitle: "Log in and Sign up screens",
                                          tech1: "Dart",
                                          tech2: "Flutter",
                                          tech3: "Firebase",
                                        ),

                                        Project_text(
                                          imagePath: "images/pic2.jpg",
                                          ontab: () {
                                            method.launchURL(
                                                "");
                                          },
                                          projectDesc:
                                          "A personal portfolio website created.",
                                          projectTitle: "Portfolio",
                                          tech1: "Dart",
                                          tech2: "Flutter",
                                        ),

                                      ],
                                    )),

                              SizedBox(height: size.height * 0.02),


                                    Column(
                            children: [
                              Container(
                                height: size.height * 0.68,
                                width: MediaQuery.of(context).size.width -
                                    100,
                                // color: Colors.orange,
                                child: Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,
                                  children: [
                                    Text(
                                       "Get In Touch",
                                      style: TextStyle(
                                        fontSize: 42.0,
                                      color: Colors.white,
                                      letterSpacing: 3.0,
                                      fontWeight: FontWeight.w700,
                                    )),
                                    SizedBox(
                                      height: 16.0,
                                    ),
                                    Wrap(
                                      children: [
                                        Text(
                                          "Whether you have a question or just want to say hi, I'll try my \nbest to get back to you!",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.white
                                                .withOpacity(0.4),
                                            letterSpacing: 0.75,
                                            fontSize: 17.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 32.0,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        method.launchEmail();
                                      },
                                      child: Card(
                                        elevation: 4.0,
                                        color: Color(0xff64FFDA),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(6.0),
                                        ),
                                        child: Container(
                                          margin: EdgeInsets.all(0.85),
                                          height: size.height * 0.09,
                                          width: size.width * 0.10,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            color: Color(0xff83a0e0),
                                            borderRadius:
                                            BorderRadius.circular(
                                                6.0),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets
                                                .symmetric(
                                              horizontal: 8.0,
                                            ),
                                            child: Text(
                                              "Say Hello",
                                              style: TextStyle(
                                                color: Color(0xff000000),
                                      ),
                                  ),
                                 ),
                            ),
                       ),
                   ),
                   ],
                ),
                ),
                              Container(
                                alignment: Alignment.center,
                                height: MediaQuery.of(context).size.height / 6,
                                width: MediaQuery.of(context).size.width -
                                    100,
                                //color: Colors.white,
                                child: Text(
                                  "Designed & Built by SAKSHI SAXENA.",
                                  style: TextStyle(
                                    color: Colors.white.withOpacity(0.4),
                                    letterSpacing: 1.75,
                                    fontSize: 14.0,
                                  ),
                                ),
                              ),
                            ],
                          ),

                            ])),
                        ],
                      ),
                      ),
            ),
      ),
      Container(
        width: MediaQuery.of(context).size.width * 0.07,
        height: MediaQuery.of(context).size.height - 82,
        //color: Colors.orange,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RotatedBox(
              quarterTurns: 45,
              child: Text(
                "sakshisaxena0808@gmail.com",
                style: TextStyle(
                  color: Colors.grey.withOpacity(0.6),
                  letterSpacing: 3.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            /*Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Container(
                height: 100,
                width: 2,
                color: Colors.grey.withOpacity(0.4),
              ),
            ),*/
          ],
        ),
      ),
      ],
    ),
    ],
    ),
    )));
  }
}


