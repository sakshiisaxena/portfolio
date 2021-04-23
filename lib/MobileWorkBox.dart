import 'package:flutter/material.dart';
import 'package:web_d/WorkCustomData.dart';

class MobileWorkBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        WorkCustomData(
          title: "GDSC Team Member",
          subTitle:
          "GDSC Banasthali Vidyapith",
          duration: "Apr,2021 - Present",
        ),
        WorkCustomData(
          title: "Graphic Designer",
          subTitle:
          "Inception Wave Student Chapter",
          duration: "Mar,2021 - Present",
        ),
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

      ],
    );
  }
}
