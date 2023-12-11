import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/data/services/user_repository.dart';
import 'package:social_media_app/generated/l10n.dart';
import 'package:social_media_app/presentation/blocs/auth/auth_bloc.dart';
import 'package:social_media_app/presentation/screens/auth/login_page.dart';
import 'package:social_media_app/presentation/screens/photo/photo_page.dart';
import 'package:social_media_app/presentation/screens/qr/qr_page.dart';
import 'package:social_media_app/presentation/screens/stories/stories_page.dart';

class ProfilePage extends StatelessWidget {
  final UserRepository userRepository;
  const ProfilePage({super.key, required this.userRepository});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(
                      'https://cdn-icons-png.flaticon.com/512/147/147142.png',
                    ),
                  ),
                  const SizedBox(height: 20),
                  FutureBuilder<User?>(
                    future: userRepository.getProfile(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        return const Text('Error loading user details');
                      } else {
                        final user = snapshot.data;

                        return Column(
                          children: [
                            Text(
                              'Имя: ${user?.displayName ?? "N/A"}',
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              'Электронная почта: ${user?.email ?? "N/A"}',
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 10),
                          ],
                        );
                      }
                    },
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      context.read<AuthBloc>().add(LogOutEvent());
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) => LoginScreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.black,
                      shape: const StadiumBorder(),
                      padding: const EdgeInsets.symmetric(
                          vertical: 16, horizontal: 32),
                    ),
                    child: Text(
                      S.of(context).signOut,
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: const BoxDecoration(
                  color: Colors.black,
                ),
                child: Text(
                  S.of(context).socialMedia,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              ListTile(
                title: Text(S.of(context).qr),
                leading: const Icon(Icons.qr_code), // Add the icon here

                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => const QrScreen(),
                    ),
                  );
                },
              ),
              ListTile(
                title: Text(S.of(context).photos),
                leading: const Icon(Icons.photo),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => const PhotoScreen(),
                    ),
                  );
                },
              ),
              ListTile(
                title: Text(S.of(context).stories),
                leading: const Icon(Icons.line_style),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => const StoriesScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
