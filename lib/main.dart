import 'package:flutter/material.dart';
import 'package:rove/screens/onBoardingPage1.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatefulWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   MyAppState createState() => MyAppState();
// }

// class MyAppState extends State<MyApp> {
//   static const String KEY_LOGIN_STATUS = 'loginStatus';

//   @override
//   void initState() {
//     super.initState();
//     checkLoginStatus();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Rove',
//       debugShowCheckedModeBanner: false,
//       home: LoginPage(),
//     );
//   }

//   void checkLoginStatus() async {
//     SharedPreferences pref = await SharedPreferences.getInstance();
//     bool? isLoggedIn = pref.getBool(KEY_LOGIN_STATUS);
//     print("condition is ");
//     print(isLoggedIn);

//     if (isLoggedIn != null) {
//       if (isLoggedIn == true) {
//         print("Navigator Executed");
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (context) => HomeScreen()),
//         );
//       } else {
//         print("Else Navigator");
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (context) => LoginPage()),
//         );
//       }
//     }
//   }
// }

// a;kjsdhjkfgahsd;fjkhasd;f

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rove',
      home: const MyHomePage(
        title: 'Flutter Demo Home Page',
        check: false,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title, required this.check});

  final String title;
  final bool check;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BoardingPage1());
  }
}
