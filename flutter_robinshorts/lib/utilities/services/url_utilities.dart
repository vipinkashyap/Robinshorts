import 'package:url_launcher/url_launcher.dart';

class UrlUtilities {
  urlLaunch(String url) async {
    if (await canLaunchUrl(Uri.parse(url)) == true) {
      await launchUrl(Uri.parse(url));
    }
  }
}
