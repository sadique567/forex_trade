import 'dart:async';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:geolocator/geolocator.dart';

class HomeController extends GetxController {
  RxBool typeSellBuy = false.obs;
  static const int unixSeconds = 1755595034;
  var formattedTime = "".obs;

  static const String kLocationServicesDisabledMessage =
      'Location services are disabled.';
  static const String kPermissionDeniedMessage = 'Permission denied.';
  static const String kPermissionDeniedForeverMessage =
      'Permission denied forever.';
  static const String kPermissionGrantedMessage = 'Permission granted.';

  final GeolocatorPlatform geolocatorPlatform = GeolocatorPlatform.instance;
  StreamSubscription<ServiceStatus>? serviceStatusStreamSubscription;
  bool positionStreamStarted = false;

  final positionItems = "".obs;

  @override
  void onInit() {
    super.onInit();
    getCurrentPosition();

    final DateTime localTime =
        DateTime.fromMillisecondsSinceEpoch(
          unixSeconds * 1000,
          isUtc: true,
        ).toLocal();

    formattedTime.value = DateFormat(
      'EEE, dd MMM yyyy • hh:mm a',
    ).format(localTime);

    print("Formatted Time: ${formattedTime.value}");
  }

  void getCurrentPosition() async {
    final hasPermission = await handlePermission();
    if (!hasPermission) return;

    final position = await Geolocator.getCurrentPosition();

    // latitude & longitude
    print("Lat: ${position.latitude}, Lng: ${position.longitude}");

    List<Placemark> placemarks = await placemarkFromCoordinates(
      position.latitude,
      position.longitude,
    );
    if (placemarks.isNotEmpty) {
      final place = placemarks.first;

      String address =
          "${place.administrativeArea}, ${place.country}, ${place.postalCode}";

      // "${place.street}, ${place.locality}, ${place.administrativeArea}, ${place.country}, ${place.postalCode}";
      positionItems.value = address;
    }
  }

  Future<bool> handlePermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await geolocatorPlatform.isLocationServiceEnabled();
    print("service Enabled :  $serviceEnabled");
    if (!serviceEnabled) {
      return false;
    }

    permission = await geolocatorPlatform.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await geolocatorPlatform.requestPermission();
      if (permission == LocationPermission.denied) {
        return false;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return false;
    }

    return true;
  }

  @override
  void dispose() {
    super.dispose();
  }
}
