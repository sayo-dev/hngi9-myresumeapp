import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:provider/provider.dart';
import 'package:rezumi/screens/home.dart';
import 'package:rezumi/screens/splash.dart';
import 'package:rezumi/utils/components/theme.dart';
import 'package:rezumi/utils/shared_data.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ThemeValueStorage.init();
  await Locales.init(['en', 'ar','fr', 'zh']);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
        builder: (context, _) {
          final themeProvider = Provider.of<ThemeProvider>(context);

          return LocaleBuilder(
            builder: (locale) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                themeMode: themeProvider.themeMode,
                theme: DefaultTheme.lightTheme,
                darkTheme: DefaultTheme.darkTheme,
                localizationsDelegates: Locales.delegates,
                supportedLocales: Locales.supportedLocales,
                locale: locale,
                initialRoute: '/splash',
                routes: {
                  '/splash': (context) => SplashScreen(),
                  '/home': (context) => HomeScreen()
                },
              );
            },
          );
        }
    );
  }
}


