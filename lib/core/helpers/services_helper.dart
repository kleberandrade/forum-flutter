import 'package:maps_launcher/maps_launcher.dart';
import 'package:url_launcher/url_launcher.dart';

class ServicesHelper {
  static void call(String number) {
    launch('tel://$number');
  }

  static Future openUrl(String url) async {
    if (!url.contains('http')) url = 'http://$url';

    if (await canLaunch(url)) {
      await launch(url);
    }
  }

  static void sendSms(String number) {
    launch('sms:$number');
  }

  static void sendEmail(String email) {
    launch('mailto:$email');
  }

  static void directions(String address) {
    MapsLauncher.launchQuery(address);
  }
}
