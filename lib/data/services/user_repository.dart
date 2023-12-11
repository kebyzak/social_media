import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final Future<SharedPreferences> _preferences;

  UserRepository(this._preferences);

  Future<User?> get user async {
    return _auth.currentUser;
  }

  Future<User> login({required String email, required String password}) async {
    try {
      final UserCredential credentials = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final userDoc =
          await _firestore.collection('users').doc(credentials.user!.uid).get();
      final displayName = userDoc['name'] as String;

      await credentials.user!.updateDisplayName(displayName);
      await _saveUser(credentials.user!);

      return credentials.user!;
    } catch (e) {
      rethrow;
    }
  }

  Future<User> register({
    required String email,
    required String name,
    required int age,
    required String password,
  }) async {
    try {
      final UserCredential credentials = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      User user = credentials.user!;

      await _firestore.collection('users').doc(user.uid).set({
        'uid': user.uid,
        'name': name,
        'email': email,
        'age': age,
      });

      await credentials.user!.updateDisplayName(name);
      await _saveUser(credentials.user!);

      return user;
    } catch (e) {
      rethrow;
    }
  }

  Future<User?> getProfile() async {
    try {
      final User? user = _auth.currentUser;
      if (user != null) {
        final userDoc =
            await _firestore.collection('users').doc(user.uid).get();

        if (userDoc.exists) {
          final name = userDoc['name'] as String;
          final email = userDoc['email'] as String;

          await user.updateDisplayName(name);
          await user.updateEmail(email);
        }
      }
      return user;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> logout() async {
    try {
      await _auth.signOut();
      await _clearUser();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> _saveUser(User user) async {
    final prefs = await _preferences;
    await prefs.setString('uid', user.uid);
  }

  Future<void> _clearUser() async {
    final prefs = await _preferences;
    await prefs.remove('uid');
  }
}
