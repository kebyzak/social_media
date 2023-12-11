// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Вход`
  String get login {
    return Intl.message(
      'Вход',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Электронная почта`
  String get email {
    return Intl.message(
      'Электронная почта',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Пароль`
  String get password {
    return Intl.message(
      'Пароль',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Нет аккаунта? `
  String get dontHaveAnAccount {
    return Intl.message(
      'Нет аккаунта? ',
      name: 'dontHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Зарегистрироваться`
  String get signUp {
    return Intl.message(
      'Зарегистрироваться',
      name: 'signUp',
      desc: '',
      args: [],
    );
  }

  /// `Введите учетные данные для входа`
  String get enterYourCredentialToLogin {
    return Intl.message(
      'Введите учетные данные для входа',
      name: 'enterYourCredentialToLogin',
      desc: '',
      args: [],
    );
  }

  /// `С возвращением!`
  String get welcomeBack {
    return Intl.message(
      'С возвращением!',
      name: 'welcomeBack',
      desc: '',
      args: [],
    );
  }

  /// `Регистрация`
  String get register {
    return Intl.message(
      'Регистрация',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `Создать аккаунт`
  String get createAnAccount {
    return Intl.message(
      'Создать аккаунт',
      name: 'createAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Введите ваши данные для регистрации`
  String get enterYourDetailsToRegister {
    return Intl.message(
      'Введите ваши данные для регистрации',
      name: 'enterYourDetailsToRegister',
      desc: '',
      args: [],
    );
  }

  /// `Имя`
  String get name {
    return Intl.message(
      'Имя',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Возраст`
  String get age {
    return Intl.message(
      'Возраст',
      name: 'age',
      desc: '',
      args: [],
    );
  }

  /// `Уже есть аккаунт? `
  String get alreadyHaveAnAccount {
    return Intl.message(
      'Уже есть аккаунт? ',
      name: 'alreadyHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Войти`
  String get signIn {
    return Intl.message(
      'Войти',
      name: 'signIn',
      desc: '',
      args: [],
    );
  }

  /// `Ваш адрес электронной почты или пароль неверны`
  String get yourEmailOrPasswordIsIncorrect {
    return Intl.message(
      'Ваш адрес электронной почты или пароль неверны',
      name: 'yourEmailOrPasswordIsIncorrect',
      desc: '',
      args: [],
    );
  }

  /// `Вам должно быть 13 лет или старше, чтобы зарегистрироваться.`
  String get ageValidation {
    return Intl.message(
      'Вам должно быть 13 лет или старше, чтобы зарегистрироваться.',
      name: 'ageValidation',
      desc: '',
      args: [],
    );
  }

  /// `Откройте для себя динамичную платформу, созданную для поддержки связей, где пользователи общаются, делятся и выражают себя в разнообразном сообществе.`
  String get onboardFirst {
    return Intl.message(
      'Откройте для себя динамичную платформу, созданную для поддержки связей, где пользователи общаются, делятся и выражают себя в разнообразном сообществе.',
      name: 'onboardFirst',
      desc: '',
      args: [],
    );
  }

  /// `Наше социальное медиа способствует созданию приветливого пространства для разнообразных голосов, предоставляя творческий холст для обмена моментами, мыслями и переживаниями с друзьями и миром.`
  String get onboardSecond {
    return Intl.message(
      'Наше социальное медиа способствует созданию приветливого пространства для разнообразных голосов, предоставляя творческий холст для обмена моментами, мыслями и переживаниями с друзьями и миром.',
      name: 'onboardSecond',
      desc: '',
      args: [],
    );
  }

  /// `Ваша конфиденциальность для нас приоритет. Мы обеспечиваем высочайшую конфиденциальность, создавая безопасную среду, где вы контролируете свою личную информацию и взаимодействия.`
  String get onboardThird {
    return Intl.message(
      'Ваша конфиденциальность для нас приоритет. Мы обеспечиваем высочайшую конфиденциальность, создавая безопасную среду, где вы контролируете свою личную информацию и взаимодействия.',
      name: 'onboardThird',
      desc: '',
      args: [],
    );
  }

  /// `Пропустить`
  String get skip {
    return Intl.message(
      'Пропустить',
      name: 'skip',
      desc: '',
      args: [],
    );
  }

  /// `Поехали!`
  String get go {
    return Intl.message(
      'Поехали!',
      name: 'go',
      desc: '',
      args: [],
    );
  }

  /// `Выйти`
  String get signOut {
    return Intl.message(
      'Выйти',
      name: 'signOut',
      desc: '',
      args: [],
    );
  }

  /// `Сканировать`
  String get scan {
    return Intl.message(
      'Сканировать',
      name: 'scan',
      desc: '',
      args: [],
    );
  }

  /// `Ошибка`
  String get error {
    return Intl.message(
      'Ошибка',
      name: 'error',
      desc: '',
      args: [],
    );
  }

  /// `Что-то пошло не так!`
  String get somethingWentWrong {
    return Intl.message(
      'Что-то пошло не так!',
      name: 'somethingWentWrong',
      desc: '',
      args: [],
    );
  }

  /// `Социальные медиа`
  String get socialMedia {
    return Intl.message(
      'Социальные медиа',
      name: 'socialMedia',
      desc: '',
      args: [],
    );
  }

  /// `QR`
  String get qr {
    return Intl.message(
      'QR',
      name: 'qr',
      desc: '',
      args: [],
    );
  }

  /// `Фотографии`
  String get photos {
    return Intl.message(
      'Фотографии',
      name: 'photos',
      desc: '',
      args: [],
    );
  }

  /// `Истории`
  String get stories {
    return Intl.message(
      'Истории',
      name: 'stories',
      desc: '',
      args: [],
    );
  }

  /// `Это новое социальное медиа.`
  String get thisIsNewSocialMedia {
    return Intl.message(
      'Это новое социальное медиа.',
      name: 'thisIsNewSocialMedia',
      desc: '',
      args: [],
    );
  }

  /// `Разнообразное сообщество!`
  String get diverseCommunity {
    return Intl.message(
      'Разнообразное сообщество!',
      name: 'diverseCommunity',
      desc: '',
      args: [],
    );
  }

  /// `Копировать ссылку`
  String get copyLink {
    return Intl.message(
      'Копировать ссылку',
      name: 'copyLink',
      desc: '',
      args: [],
    );
  }

  /// `Нет разрешения`
  String get noPermission {
    return Intl.message(
      'Нет разрешения',
      name: 'noPermission',
      desc: '',
      args: [],
    );
  }

  /// `Не удалось загрузить фотографии`
  String get failedToLoadPhotos {
    return Intl.message(
      'Не удалось загрузить фотографии',
      name: 'failedToLoadPhotos',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
