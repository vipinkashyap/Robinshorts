import 'package:url_launcher/url_launcher.dart';

class Utils {
  launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launchUrl(url);
    } else {
      throw Exception('Could not launch $url');
    }
  }
}
