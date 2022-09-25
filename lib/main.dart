import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:skilltest_pt_bintoro/service/notification_service.dart';
import 'package:skilltest_pt_bintoro/screen/homeScreen/home_screen.dart';
import 'package:skilltest_pt_bintoro/utils/colors.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService().initNotification();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme:
              const TextTheme(bodyText1: TextStyle(), bodyText2: TextStyle())
                  .apply(bodyColor: Colors.white),
          scaffoldBackgroundColor: primaryBlack,
          colorScheme: ColorScheme.fromSeed(
              seedColor: secondaryBlack,
              brightness: Brightness.light,
              primary: secondaryBlack),
        ),
        home: const HomeScreen());
  }
}
