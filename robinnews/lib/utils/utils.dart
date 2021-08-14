import 'package:url_launcher/url_launcher.dart' as urlLauncher;

class Utils {
  launchUrl(String url) async {
    if (await urlLauncher.canLaunch(url)) {
      await urlLauncher.launch(url);
    } else {
      throw Exception('Could not launch $url');
    }
  }
}
