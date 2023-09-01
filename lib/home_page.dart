import 'package:firebase_notification/notific_services.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  NotificationServices notificationServices = NotificationServices();
  String token = '';
  @override
  void initState() {
    notificationServices.requestPermisson();
    //notificationServices.tokenRefresh();
    notificationServices.firebaseInit(context);
    notificationServices.getDeviceToken().then((value) {
      token = value;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text("Testing Notification"),
      ),
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width / 1.2,
          child: SelectableText(
            token,
            style: const TextStyle(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
