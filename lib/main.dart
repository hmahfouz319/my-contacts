import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'my_contacts.dart';
import 'my_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ActionsIconProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => SocialIconProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyContacts(),
      ),
    );
  }
}
