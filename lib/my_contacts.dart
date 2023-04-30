import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class MyContacts extends StatefulWidget {
  MyContacts({super.key});

  @override
  State<MyContacts> createState() => _MyContactsState();
}

class _MyContactsState extends State<MyContacts> {
  String? myPlatform;
  Uri? myUrl;
  Uri phoneNumber = Uri.parse('tel:+96566230370');
  Map<String, String> socialMedia = {
    "facebook.png": "https://www.facebook.com/hisham.mahfouz.39",
    // "facebook":Uri.parse("https://www.facebook.com/hisham.mahfouz.39") ,
    'linkedin.png': 'https://www.linkedin.com/feed/',
    "watsapp.png": "https://wa.me/+96566230370",
  };

  // List<String> socialMedia = [
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('My Contact Screen'),
        leading: InkWell(
          child: Icon(Icons.home),
          onTap: () {
            print('Icon is pressed');
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              icon: myPlatform == null
                  ? Icon(
                      Icons.phone,
                      size: 25,
                      // color: Colors.grey,
                    )
                  : Material(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(50),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      elevation: 4,
                      child: Image(
                          image: AssetImage(
                            "assets/$myPlatform",
                          ),
                          fit: BoxFit.cover),
                    ),
              onPressed: () {
                // launchUrl(Uri.parse('tel:+96566230370'));
                myUrl == null
                    ? launchUrl(phoneNumber)
                    : launchUrl(myUrl!, mode: LaunchMode.externalApplication);
              },
            ),
          ),
        ],
      ),
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
              GridView.builder(
                itemCount: socialMedia.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(12),
                    child: InkWell(
                      
                      child: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        backgroundImage: AssetImage(
                            'assets/${socialMedia.keys.toList()[index]}'),
                        radius: 40,
                      ),
                      onDoubleTap: () {
                        myPlatform = socialMedia.keys.toList()[index];
                        myUrl = Uri.parse(socialMedia.values.toList()[index]);
                        setState(() {});
                      },
                      onTap: () {
                        // print('current value = $myPlatform');
                        myPlatform = socialMedia.keys.toList()[index];
                        myUrl = Uri.parse(socialMedia.values.toList()[index]);
                        // print('current value = $myPlatform');
                        setState(() {});
                        launchUrl(Uri.parse(socialMedia.values.toList()[index]),
                            mode: LaunchMode.externalApplication);
                      },
                    ),
                  );
                },
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.all(20),
              ),
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
