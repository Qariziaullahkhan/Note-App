import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note_app/core/utils/firebase_config.dart';
import 'package:note_app/presentation/providers/auth_provider.dart';
import 'package:note_app/presentation/providers/note_provider.dart';
import 'package:note_app/presentation/screens/auth/login_screen.dart';
import 'package:note_app/presentation/screens/homescreen.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await FirebaseConfig.initialize();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => NoteProvider()),
      ],
      child: ScreenUtilInit(
        designSize: Size(375, 812),
        builder: (_, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Consumer<AuthProvider>(
            builder: (context, auth, _) {
              return StreamBuilder(
                stream: auth.authStateChanges(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting){
                    return  Scaffold(
                      body: Center(child: CircularProgressIndicator()
                    ),
                    );
                  }
                  if (snapshot.hasData) {
                    return  HomeScreen();
                  } else {
                    return LoginScreen();
                  }
                    
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
