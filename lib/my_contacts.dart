import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'widgets/contacts_grid.dart';


// ignore: must_be_immutable
class MyContacts extends StatelessWidget {
  MyContacts({super.key});

  Map<String, String> socialMedia = {
    "facebook.png": "https://www.facebook.com/hisham.mahfouz.39",
    'linkedin.png': 'https://www.linkedin.com/feed/',
    "watsapp.png": "https://wa.me/+96566230370",
  };

  // List<String> socialMedia = [
  //   "facebook.png",
  //   // 'github.png',
  //   // 'Instagram.png',
  //   'linkedin.png',
  //   // 'tiktok.png',
  //   // 'vimeo.png',
  //   "watsapp.png",
  //   // 'youtube.png',
  //   // '33.jpg'
  // ];
  // List<String> socialMediaLink = [
  //   "https://www.facebook.com/hisham.mahfouz.39",
  //   // 'github.png',
  //   // 'Instagram.png',
  //   'https://www.linkedin.com/feed/',
  //   // 'tiktok.png',
  //   // 'vimeo.png',
  //   "https://wa.me/+96566230370",
  //   // 'youtube.png',
  //   // '33.jpg'
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 3, 7, 30),
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 80,
              ),
              CircleAvatar(
                backgroundImage: AssetImage("assets/33.jpg"),
                radius: 120,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Hisham Mahfouz",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                // mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "+965 66230370",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.phone,
                      size: 30,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      launchUrl(Uri.parse('tel:+96566230370'));
                    },
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              ContactsGrid(socialMedia: socialMedia),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

