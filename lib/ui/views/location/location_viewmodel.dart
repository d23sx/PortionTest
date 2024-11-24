import 'package:stacked/stacked.dart';
import 'package:url_launcher/url_launcher.dart';

class LocationViewModel extends BaseViewModel {
  ///location of Oz cafe
  final double latitude = 26.232690;
  final double longitude = 50.578110;
  void openMap() async {
    final Uri googleMapsUrl = Uri.parse('https://www.google.com/maps/search/?api=1&query=$latitude,$longitude');
    if (await canLaunchUrl(googleMapsUrl )) {
      await launchUrl(googleMapsUrl );
    } else {
      throw 'Could not launch $googleMapsUrl';
    }
  }
}
