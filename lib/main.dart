import 'package:boosky/screens/book_shelf.dart';
import 'package:boosky/screens/categories.dart';
import 'package:boosky/screens/home.dart';
import 'package:boosky/state/book_shelf.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BookShelfBloc(BookShelfState([])),
      child: MaterialApp(
        title: 'Booksy',
        theme: ThemeData(
          primarySwatch: Colors.cyan,
        ),
        home: const BooksyApp(title: 'Boosky'),
      ),
    );
  }
}

class BooksyApp extends StatefulWidget {
  const BooksyApp({super.key, required this.title});

  final String title;

  @override
  State<BooksyApp> createState() => _BooksyAppState();
}

class _BooksyAppState extends State<BooksyApp> {
  int _selectIndex = 0;

  static List<Widget> pages = [
    const Home(),
    const Categories(),
    const BookShelf()
  ];
  @override
  Widget build(BuildContext context) {
    initNotification(context);
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Inicio"),
            BottomNavigationBarItem(
                icon: Icon(Icons.library_books), label: "Biblioteca"),
            BottomNavigationBarItem(
                icon: Icon(Icons.auto_stories), label: "Mi Estante")
          ],
          currentIndex: _selectIndex,
          onTap: onItemActive,
        ),
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: pages[_selectIndex]);
  }

  void onItemActive(int value) {
    setState(() {
      _selectIndex = value;
    });
  }

  void initNotification(BuildContext context) async {
    var fcmToken = await FirebaseMessaging.instance.getToken();
    //print(fcmToken);

    //initLocalNotification();
    initPushNotification(context);
  }

  void startReminder() {
    Future.delayed(const Duration(seconds: 4), () {
      // _showNotification();
    });
  }

  void _showNotification(String title, String body) {
    const AndroidNotificationDetails androidspecs =
        AndroidNotificationDetails("channelId", "channelName");

    FlutterLocalNotificationsPlugin notification =
        FlutterLocalNotificationsPlugin();
    notification.show(
        1, title, body, const NotificationDetails(android: androidspecs),
        payload: "20");
  }

  void initLocalNotification() async {
    FlutterLocalNotificationsPlugin notification =
        FlutterLocalNotificationsPlugin();

    AndroidInitializationSettings androidSettings =
        const AndroidInitializationSettings('icon');

    InitializationSettings initializationSettings =
        InitializationSettings(android: androidSettings);

    await notification.initialize(initializationSettings);

    startReminder();
  }

  void initPushNotification(BuildContext context) {
    FirebaseMessaging.onMessage.listen(_onRemoteMessage);
    //FirebaseMessaging.onBackgroundMessage(_onBackgroundMessage);
  }

  /* Future<void> _onBackgroundMessage(RemoteMessage message) async {
    print((message.notification!.body ?? "sin mensaje"));
  } */

  void _onRemoteMessage(RemoteMessage message) {
    String title = message.notification!.title ?? "Titulo";
    String body = message.notification!.body ?? "Cuerpo";
    _showNotification(title, body);
    // print((message.notification!.body ?? "sin mensaje"));
  }
}
