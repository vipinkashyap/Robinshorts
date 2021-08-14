import 'package:url_launcher/url_launcher.dart';

class Utilities {
  String? hoursBetween(DateTime dateOne, DateTime dateTwo) {
    return (dateTwo.difference(dateOne).inHours.toString() + 'h');
  }

  urlLaunch(String url) async {
    if (await canLaunch(url) == true) {
      await launch(url);
    }
  }
}
