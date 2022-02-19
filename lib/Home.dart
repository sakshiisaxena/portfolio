import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:web_d/About.dart';
import 'package:web_d/AppBarTitle.dart';
import 'package:web_d/CustomText.dart';
import 'package:web_d/FeatureProject.dart';
import 'package:web_d/Method.dart';
import 'package:web_d/Work.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Method method = Method();
  AutoScrollController _autoScrollController;
  final scrollDirection = Axis.vertical;

  bool isExpaned = true;

  bool get _isAppBarExpanded {
    return _autoScrollController.hasClients &&
        _autoScrollController.offset > (160 - kToolbarHeight);
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
                colors: [const Color(0xff780206), const Color(0xff061161)],
              )
          ),
          child: Column(
            children: [
              //Mavigation Bar
              Container(
                height: size.height * 0.14,
                width: size.width,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
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
                                    text: 'Experience',
                                  ),
                                ),
                                Tab(
                                  child: AppBarTitle(
                                    text: 'Project',
                                  ),
                                ),
                                Tab(
                                  child: AppBarTitle(
                                    text: 'Contact Me',
                                  ),
                                ),
                                MaterialButton(
                                  onPressed: () async {
                                    method.launchURL("https://drive.google.com/file/d/1qeUgOGZ0JFwUj9Sqjdp8VEYAKXWn_pud/view?usp=sharing");
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
                        IconButton(
                            icon: FaIcon(FontAwesomeIcons.github),
                            color: Color(0xffffA8B2D1),
                            iconSize: 16.0,
                            onPressed: () {
                              method.launchURL("https://github.com/sakshiisaxena");
                            }),
                        IconButton(
                            icon: FaIcon(FontAwesomeIcons.linkedin),
                            color: Color(0xffffA8B2D1),
                            iconSize: 16.0,
                            onPressed: () {
                              method.launchURL("https://www.linkedin.com/in/sakshi-saxena-356717186/");
                            }),
                        IconButton(
                          icon: FaIcon(FontAwesomeIcons.twitter),
                          color: Color(0xffffA8B2D1),
                          onPressed: () {
                            method.launchURL(
                                "https://twitter.com/sakshiEmpowers");
                          },
                          iconSize: 16.0,
                        ),
                        IconButton(
                          icon: FaIcon(FontAwesomeIcons.instagram),
                          color: Color(0xffffA8B2D1),
                          onPressed: () {
                            method.launchURL(
                                "https://www.instagram.com/_sakshisaxena/?hl=en");
                          },
                          iconSize: 16.0,
                        ),
                        IconButton(
                          icon: FaIcon(FontAwesomeIcons.facebook),
                          color: Color(0xffffA8B2D1),
                          onPressed: () {
                            method.launchURL(
                                "https://www.facebook.com/sakshi.saxena.370/");
                          },
                          iconSize: 16.0,
                        ),
                        // IconButton(
                        //     icon: Icon(Icons.call),
                        //     color: Color(0xffffA8B2D1),
                        //     iconSize: 16.0,
                        //     onPressed: () {
                        //       method.launchCaller();
                        //     }),
                        IconButton(
                            icon: Icon(Icons.mail),
                            color: Color(0xffffA8B2D1),
                            iconSize: 16.0,
                            onPressed: () {
                              method.launchEmail();
                            }),
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
                                  Center(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          height: size.height * 0.08,
                                        ),
                                        ClipRRect(
                                            borderRadius: BorderRadius.all(Radius.circular(80)),
                                            child: Image.asset(
                                              "images/sakshi-saxena.jpg",
                                              width: 150,
                                              height: 150,
                                            )
                                        ),

                                        SizedBox(
                                          height: 10.0,
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
                                          height: 4.0,
                                        ),
                                        Container(
                                          padding: EdgeInsets.symmetric(horizontal: 200),
                                          child: Text(
                                            "A pre-final year engineering student who loves to explore new horizons including open-source contribution and wishes to create an impact and encourage the community.",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Color(0xffCCD6F6).withOpacity(0.6),
                                              fontWeight: FontWeight.w700,
                                              fontSize: 30,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: size.height * .12,
                                        ),

                                        //get in tuch text


                                        SizedBox(
                                          height: size.height * 0.20,
                                        ),
                                      ],
                                    ),
                                  ),



                                  //About Me
                                  _wrapScrollTag(
                                    index: 0,
                                    child: About(),
                                  ),
                                  SizedBox(
                                    height: size.height * 0.02,
                                  ),

                                  //Where I've Worked
                                  _wrapScrollTag(
                                      index: 1,
                                      child:Work()
                                  ),
                                  SizedBox(
                                    height: size.height * 0.10,
                                  ),

                                  //Some Things I've Built Main Project
                                  _wrapScrollTag(
                                      index: 2,
                                      child: Column(
                                        children: [

                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                "What I've build",
                                                style: TextStyle(
                                              fontSize: 26.0,
                                              color: Color(0xffCCD6F6),
                                              fontWeight: FontWeight.w700,
                                              )),
                                          SizedBox(
                                            width: 26.0,
                                          ),
                                          Container(
                                            width: MediaQuery.of(context).size.width / 4,
                                            height: 0.75,
                                            color: Color(0xff303C55),
                                          ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: size.height * 0.04,
                                          ),
                                          FeatureProject(
                                            imagePath: "images/pic1.jpg",
                                            ontab: () {
                                              method.launchURL(
                                                  "https://github.com/sakshiisaxena/flutter_flight_app");
                                            },
                                            projectDesc:
                                            "A flight booking UI. The purpose of this project is to learn about lists and UI Design.",
                                            projectTitle: "Flight Booking App",
                                            tech1: "Flutter",
                                            tech2: "Dart",
                                            tech3: "Flutter UI",
                                          ),

                                          FeatureProject(
                                            imagePath: "images/pic2.jpg",
                                            ontab: () {
                                              method.launchURL(
                                                  "https://github.com/sakshiisaxena/funccforce_app_init");
                                            },
                                            projectDesc:
                                            "A Log in & Sign up screen UI. The purpose was to learn and use Firebase.",
                                            projectTitle: "Log In & Sign up screen",
                                            tech1: "Dart",
                                            tech2: "Flutter",
                                            tech3: "Firebase",
                                          ),

                                          FeatureProject(
                                            imagePath: "images/pic3.jpg",
                                            ontab: () {
                                              method.launchURL(
                                                  "https://sakshi-saxena-portfolio.netlify.app/#/");
                                            },
                                            projectDesc:
                                            "A personal portfolio built.",
                                            projectTitle: "Personal Portfolio",
                                            tech1: "Dart",
                                            tech2: "Flutter",
                                          ),

                                          FeatureProject(
                                            imagePath: "images/pic7.jpg",
                                            ontab: () {
                                              method.launchURL(
                                                  "https://github.com/sakshiisaxena/Flutter_UI");
                                            },
                                            projectDesc:
                                            "A fashion Store app that allows you to shop for various trendy clothes. ",
                                            projectTitle: "A fashion store UI.",
                                            tech1: "Dart",
                                            tech2: "Flutter",
                                          ),
                                        ],
                                      )),

//other Project
                                  SizedBox(
                                    height: 6.0,
                                  ),

                                  //Get In Touch
                                  _wrapScrollTag(
                                    index: 3,
                                    child: Column(
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
                                              CustomText(
                                                text: "Get In Touch",
                                                textsize: 42.0,
                                                color: Colors.white,
                                                letterSpacing: 3.0,
                                                fontWeight: FontWeight.w700,
                                              ),
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
                                                  color: Colors.black,
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
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),

                                        //Footer
                                        Container(
                                          alignment: Alignment.center,
                                          height:
                                          MediaQuery.of(context).size.height /
                                              6,
                                          width: MediaQuery.of(context).size.width -
                                              100,
                                          //color: Colors.white,
                                          child: Text(
                                            "Designed & Built by SAKSHI SAXENA",
                                            style: TextStyle(
                                              color: Colors.white.withOpacity(0.4),
                                              letterSpacing: 1.75,
                                              fontSize: 14.0,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
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
