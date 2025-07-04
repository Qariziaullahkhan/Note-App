import 'package:firebase_core/firebase_core.dart';
import 'package:note_app/firebase_options.dart';

class FirebaseConfig {
  static Future<void>initialize()async {
    try {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
    } catch (e) {
      print("Firebase initialization error: $e");
    }

  }
}
