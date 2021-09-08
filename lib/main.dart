import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:tcc/navigation/app_navigator.dart';
import 'package:tcc/util/simple_bloc_observer.dart';
import 'package:tcc/util/theme/custom_theme.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();

  print("Handling a background message: ${message.messageId}");
}

void main() async {
  Bloc.observer = SimpleBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State createState() => AppState();
}

class AppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TCC',
      theme: CustomTheme.getTheme(),
      home: SafeArea(child: AppNavigator()),
    );
  }

  @override
  void initState() {
    FirebaseMessaging.instance.getToken().then((value) => print(value));
    FirebaseMessaging.onMessage.listen((event) {
      print(event.data);
    });

    super.initState();
  }
}
