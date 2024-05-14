// FLUTTER PACKAGES
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_gen/gen_l10n/localization.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

// CORE
import 'routes/app_routes.dart';
import 'package:flutter_clean_code/core/di/injection.dart';
import 'package:flutter_clean_code/core/theme/light_theme.dart';
import 'package:flutter_clean_code/core/theme/dark_theme.dart';
import 'package:flutter_clean_code/core/config/env_config.dart';

void main() async {
  await dotenv.load();
  EnvConfig.setEnvironment();

  WidgetsFlutterBinding.ensureInitialized();
  await configureInjection();
  runApp(const FlutterCleanCode());
}

class FlutterCleanCode extends StatelessWidget {
  const FlutterCleanCode({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'FlutterCleanCode',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system,
      localizationsDelegates: const [
        Localization.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('pt'),
        Locale('en'),
      ],
      routerDelegate: AppRoutes.router.routerDelegate,
      routeInformationParser: AppRoutes.router.routeInformationParser,
      routeInformationProvider: AppRoutes.router.routeInformationProvider,
    );
  }
}
