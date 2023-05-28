import 'package:flutter/material.dart';
import 'package:push_app/src/pages/mensaje_page.dart';
import 'package:push_app/src/providers/push_notifications_provider.dart';
import 'src/pages/home_page.dart';


void main()async {

    WidgetsFlutterBinding.ensureInitialized();
    await PushNotificationService.initializeApp();

  runApp(const MyApp());
} 
  

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();


  @override
  void initState() {
    super.initState();

    //Context!
    PushNotificationService.messagesStream.listen((message) { 
     print('Argument desde main: $message');
      
    //  print('MyApp prueba: $message');
      navigatorKey.currentState?.pushNamed('mensaje', arguments: message );

    });
   // final pushProvider = new PushNotificationsProvider();
    //pushProvider.initNotifications();
  }




  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      title: 'Material App',
      initialRoute: 'home',
      routes: {
        'home':(BuildContext c) => HomePage(),
        'mensaje':(BuildContext c) => MensajePage(),
      },
    );
  }
}