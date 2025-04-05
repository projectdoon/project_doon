import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:mydoon/Backend/MongoDB.dart';
import 'package:mydoon/Providers/auth_provider.dart';
import 'package:mydoon/start_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Home_Screen_ui/Navigation_menu.dart';
import 'firebase_options.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print(
      "📩 Background Notification Received: ${message.notification?.title} - ${message.notification?.body}");
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Register background message handler

  SharedPreferences prefs = await SharedPreferences.getInstance();
  await MongoDatabase.connect();

  String? token = prefs.getString('token');

  // Initialize local notifications
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');
  const InitializationSettings initializationSettings =
      InitializationSettings(android: initializationSettingsAndroid);
  await flutterLocalNotificationsPlugin.initialize(initializationSettings);

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  runApp(ProviderScope(
    overrides: [
      tokenProvider
          .overrideWith((ref) => TokenNotifier()..setToken(token ?? ''))
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const NotificationScreen(),
    );
  }
}

class NotificationScreen extends ConsumerStatefulWidget {
  const NotificationScreen({super.key});

  @override
  ConsumerState<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends ConsumerState<NotificationScreen> {
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  FirebaseAnalytics _firebaseAnalytics = FirebaseAnalytics.instance;

  @override
  void initState() {
    super.initState();

    // Request notification permissions
    FirebaseMessaging.instance
        .requestPermission(
      alert: true,
      badge: true,
      sound: true,
    )
        .then((settings) {
      if (settings.authorizationStatus == AuthorizationStatus.authorized) {
        print("✅ User granted notification permission");
      } else {
        print("❌ User denied notification permission");
      }
    });

    _firebaseMessaging.subscribeToTopic("all_users");
    _firebaseAnalytics.logAppOpen();

    // Handle foreground notifications
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print(
          '📩 Foreground Notification: ${message.notification?.title} - ${message.notification?.body}');
      _showNotification(message);
    });

    // Handle notification click when the app is in the background
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print(
          "🔔 Notification clicked: ${message.notification?.title} - ${message.notification?.body}");
    });

    // Get and print the FCM token
    _firebaseMessaging.getToken().then((token) {
      print('🛠️ FCM Token: $token');
    });
  }

  Future<void> _showNotification(RemoteMessage message) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'alert_channel_id',
      'New Alerts',
      importance: Importance.max,
      priority: Priority.high,
    );

    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.show(
      0,
      message.notification?.title ?? "New Notification",
      message.notification?.body ?? "You have a new alert!",
      platformChannelSpecifics,
    );
  }

  @override
  Widget build(BuildContext context) {
    final token = ref.watch(tokenProvider);
    return Scaffold(
      body: (token != null && !JwtDecoder.isExpired(token))
          ? NavigationMenu()
          : const StartScreen(),
    );
  }
}
