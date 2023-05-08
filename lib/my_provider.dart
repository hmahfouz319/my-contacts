import 'package:flutter/material.dart';

class ActionsIconProvider extends ChangeNotifier {
  String? _myPlatform;
  Uri? _myUrl;
  
  String name = 'Hisham Mahfouz';

  void changeName() {
    if (name == 'Hisham Mahfouz')
      name = 'NCM Investment';
    else
      name = 'Hisham Mahfouz';
  }

  void setMyPlatform(value) {
    _myPlatform = value;
    notifyListeners();
  }

  void setMyUrl(value) {
    _myUrl = value;
    notifyListeners();
  }

  String getMyPlatform() => _myPlatform ?? 'facebook.png';

  Uri getMyUrl() =>
      _myUrl ?? Uri.parse("https://www.facebook.com/hisham.mahfouz.39");

  @override
  void notifyListeners() {
    // TODO: implement notifyListeners
    super.notifyListeners();
  }
}

class SocialIconProvider extends ChangeNotifier {
  double? radius;
  @override
  void notifyListeners() {
    // TODO: implement notifyListeners
    super.notifyListeners();
  }
}
