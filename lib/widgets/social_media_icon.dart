import 'package:flutter/material.dart';
import 'package:my_contacts/my_provider.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class SocialMediaIcon extends StatelessWidget {
  String socialMedia;
  String socialMedialink;
  bool clicked = false;

  SocialMediaIcon({
    Key? key,
    required this.socialMedia,
    required this.socialMedialink,
  }) : super(key: key);

  double? myRadius;

  @override
  Widget build(BuildContext context) {
    return Consumer2<ActionsIconProvider, SocialIconProvider>(
      builder: (context, value, iconData, child) {
        print("Platform is in build");
        return Padding(
          padding: const EdgeInsets.all(12),
          child: InkWell(
            child: CircleAvatar(
              backgroundColor: Colors.transparent,
              backgroundImage: AssetImage('assets/$socialMedia'),
              radius: 50,
            ),
            onDoubleTap: () {
              value.setMyPlatform(socialMedia);
              value.setMyUrl(Uri.parse(socialMedialink));
              // value.myPlatform = widget.socialMedia;
              // value.myUrl = Uri.parse(widget.socialMedialink);
              // value.notifyListeners();
              // print(value.myPlatform);
              // print(value.myUrl);
            },
            onTap: () {
              iconData.radius == 50
                  ? {
                      iconData.radius = 20,
                      value.notifyListeners(),
                      myRadius = iconData.radius
                    }
                  : {
                      iconData.radius = 50,
                      value.notifyListeners(),
                      myRadius = iconData.radius
                    };

              launchUrl(Uri.parse(socialMedialink),
                  mode: LaunchMode.externalApplication);
            },
          ),
        );
      },
    );
  }
}
