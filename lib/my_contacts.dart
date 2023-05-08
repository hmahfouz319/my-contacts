import 'package:flutter/material.dart';
import 'package:my_contacts/my_provider.dart';
import 'package:my_contacts/widgets/social_media_icon.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:tuple/tuple.dart';

// ignore: must_be_immutable
class MyContacts extends StatelessWidget {
  MyContacts({super.key});

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
          Selector<ActionsIconProvider, Tuple2<String?, Uri?>>(
            selector: (p0, p1) => Tuple2(p1.getMyPlatform(), p1.getMyUrl()),
            builder: (context, Object, child) {
              print("Actions is in build");
              return Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: IconButton(
                  icon: Object.item1 == null
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
                                "assets/${Object.item1}",
                              ),
                              fit: BoxFit.cover),
                        ),
                  onPressed: () {
                    // launchUrl(Uri.parse('tel:+96566230370'));
                    Object.item2 == null
                        ? launchUrl(phoneNumber)
                        : launchUrl(Object.item2!,
                            mode: LaunchMode.externalApplication);
                  },
                ),
              );
            },
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
              Consumer<ActionsIconProvider>(
                builder: (context, value, child) {
                  print("Button is in build");
                  return ElevatedButton(
                    onPressed: () {
                      value.changeName();
                      value.notifyListeners();
                    },
                    child: Text('Change Name'),
                  );
                },
              ),
              SizedBox(
                height: 20,
              ),
              Selector<ActionsIconProvider, String>(
                selector: (p0, p1) => p1.name,
                builder: (context, value, child) {
                  print("Name is in build");
                  return Text(
                    value,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  );
                },
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
                  return SocialMediaIcon(
                    socialMedia: socialMedia.keys.toList()[index],
                    socialMedialink: socialMedia.values.toList()[index],
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
