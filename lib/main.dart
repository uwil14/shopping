
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shopping/Herramientas/Dashboard.dart';
import 'package:sizer/sizer.dart';
import 'Herramientas/SplashScreen.dart';
import 'Provider/UnicoProvider.dart';


//Color Verde 0D7D34
//Color Rojo E30614

//Tamaño 46 alto 30 ancho

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => UnicoProvider()),
    ],
    child: Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Unico Shopping",
        home: MyApp(),
      );
    }),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent, statusBarIconBrightness: Brightness.light,statusBarBrightness: Brightness.light));
    Route _createRoute() {
      return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              SplashScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            var begin = Offset(0.1, 0.0);
            var end = Offset.zero;
            var curve = Curves.linearToEaseOut;

            var tween = Tween(begin: begin, end: end);
            var curvedAnimation = CurvedAnimation(
              parent: animation,
              curve: curve,
            );

            return SlideTransition(
              position: tween.animate(curvedAnimation),
              child: child,
            );
          });
    }

    Future<void> authenticar(context) async {

       Future<User?> signInUsingEmailPassword({
        required String email,
        required String password,
        required BuildContext context,
      }) async {
        FirebaseAuth auth = FirebaseAuth.instance;
        User? user;

        try {
          UserCredential userCredential = await auth.signInWithEmailAndPassword(
            email: email,
            password: password,
          );
          user = userCredential.user;
        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
          } else if (e.code == 'wrong-password') {}
        }

        return user;
      }

       User? user = await signInUsingEmailPassword(
        email: "admin@unico.com",
        password: "123456",
        context: context,
      );
      if (user != null) {
        Navigator.of(context).pushReplacement(_createRoute());
      }
    }

    //authenticar(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:

      Dashboard()


     // Scaffold(
     //   backgroundColor: Colors.white,
     // ),
    );
  }
}
