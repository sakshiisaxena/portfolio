import 'package:flutter/material.dart';
import 'package:web_d/WorkCustomData.dart';

class WorkBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        WorkCustomData(
          title: "Co - founder at funccFORCE",
          subTitle:
          "A women technical community",
          duration: "Oct,2020 - Present",
        ),
        WorkCustomData(
          title: "Operations and Outreach Director",
          subTitle:
          "Schaffen Softwares",
          duration: "Aug,2020 - Present",
        ),
        WorkCustomData(
          title:
          "Blogger & Operational Lead",
          subTitle:
          "Blogscord powered by Schaffen Softwares",
          duration: "April,2020 - Present",
        ),
        WorkCustomData(
          title: "Banasthali Vidyapith",
          subTitle:
          "B.tech in Electronics & Communication",
          duration: "2019 - Present",
        ),
        WorkCustomData(
          title: "Lucknow Public College",
          subTitle:
          "School",
          duration: "2004 - 2019",
        ),
      ],
    );
  }
}
