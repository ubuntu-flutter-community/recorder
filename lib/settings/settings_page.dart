import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../l10n/l10n.dart';
import 'settings_model.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  static Widget create(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SettingsModel(),
      child: const SettingsPage(),
    );
  }

  static Widget createTitle(BuildContext context) =>
      Text(context.l10n.settingsTitle);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  void initState() {
    final model = context.read<SettingsModel>();
    model.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final model = context.watch<SettingsModel>();
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextButton(
            onPressed: () => showAboutDialog(
              context: context,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text(model.appName)],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('${context.l10n.version}: '),
                    Text(model.version)
                  ],
                )
              ],
            ),
            child: Text('${context.l10n.about} ${model.appName}'),
          )
        ],
      ),
    );
  }
}
