import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:social_media_app/data/services/photo_repository.dart';
import 'package:social_media_app/data/services/user_repository.dart';
import 'package:social_media_app/firebase_options.dart';
import 'package:social_media_app/generated/l10n.dart';
import 'package:social_media_app/presentation/blocs/auth/auth_bloc.dart';
import 'package:social_media_app/presentation/blocs/photo/photo_bloc.dart';
import 'package:social_media_app/presentation/screens/onboarding/onboarding_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = SharedPreferences.getInstance();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MainApp(preferences: prefs));
}

class MainApp extends StatelessWidget {
  final Future<SharedPreferences> preferences;

  const MainApp({super.key, required this.preferences});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              AuthBloc(userRepository: UserRepository(preferences)),
        ),
        BlocProvider(
          create: (context) =>
              PhotoBloc(photoRepository: PhotoRepository(Dio())),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        home: const OnBoardingScreen(),
      ),
    );
  }
}
