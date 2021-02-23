import 'package:flutter/widgets.dart';
import 'package:web_d/Home.dart';
import 'package:web_d/MobileHome.dart';

class Hom extends StatefulWidget {
  @override
  _HomState createState() => _HomState();
}

class _HomState extends State<Hom> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 1000) {
          return HomePage();
        } else {
          return MobileHome();
        }
      },
    );
  }
}
