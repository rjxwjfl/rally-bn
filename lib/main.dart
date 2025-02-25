import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:rally/app_init.dart';
import 'package:shared_preferences/shared_preferences.dart';

// global navigator context key
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

// secure storage configs
AndroidOptions _aOptions =
    const AndroidOptions(encryptedSharedPreferences: true);
IOSOptions _iOptions =
    const IOSOptions(accessibility: KeychainAccessibility.first_unlock);
final storage = FlutterSecureStorage(aOptions: _aOptions, iOptions: _iOptions);
late SharedPreferences prefs;

// main
Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();
  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await initializeDateFormatting().then((_) => runApp(const AppInit()));
}
