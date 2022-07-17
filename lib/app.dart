import 'package:flutter/material.dart';
import 'package:recorder/home/home_page.dart';
import 'package:recorder/l10n/l10n.dart';
import 'package:recorder/settings/settings_page.dart';
import 'package:yaru/yaru.dart';
import 'package:yaru_icons/yaru_icons.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return YaruTheme(
      builder: (context, value, child) {
        return MaterialApp(
          theme: value.variant?.theme ?? yaruLight,
          darkTheme: value.variant?.darkTheme ?? yaruDark,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          debugShowCheckedModeBanner: false,
          home: const Scaffold(
            body: YaruCompactLayout(
              pageItems: [
                YaruPageItem(
                  titleBuilder: HomePage.createTitle,
                  builder: HomePage.create,
                  iconData: YaruIcons.home,
                ),
                YaruPageItem(
                  titleBuilder: SettingsPage.createTitle,
                  builder: SettingsPage.create,
                  iconData: YaruIcons.settings,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
