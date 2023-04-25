import 'package:flutter/material.dart';

import '../start.dart';

// ignore: must_be_immutable
class SocialMediaIcon extends StatelessWidget {
  String socialMedia;
  String socialMedialink;
  SocialMediaIcon({
    Key? key,
    required this.socialMedia,
    required this.socialMedialink,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: InkWell(
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          backgroundImage: AssetImage('assets/$socialMedia'),
          radius: 40,
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => StartSocialMedia(socialMedialink: socialMedialink,
                      
                    )),
          );
        },
      ),
    );
  }
}
