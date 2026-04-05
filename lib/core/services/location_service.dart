import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';

class LocationService {
  /// 1) Get Current User Location
  Future<Position> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception('Location services are disabled.');
    }

    // Check location permissions
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw Exception('Location permissions are permanently denied, cannot request permissions.');
    }

    // Returns current location
    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  }

  /// 2) Calculate Distance Between 2 points (in KM)
  double calculateDistanceInKm(double userLat, double userLng, double restLat, double restLng) {
    double distanceInMeters = Geolocator.distanceBetween(
      userLat,
      userLng,
      restLat,
      restLng,
    );
    return distanceInMeters / 1000;
  }

  /// 3) Open Restaurant in Google Maps
  Future<void> openGoogleMaps(double lat, double lng) async {
    final Uri googleMapUrl = Uri.parse(
      "https://www.google.com/maps/search/?api=1&query=$lat,$lng",
    );

    if (await canLaunchUrl(googleMapUrl)) {
      await launchUrl(googleMapUrl, mode: LaunchMode.externalApplication);
    } else {
      throw Exception("Could not open Google Maps");
    }
  }
}
