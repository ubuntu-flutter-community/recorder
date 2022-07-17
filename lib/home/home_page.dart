import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../l10n/l10n.dart';
import 'home_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static Widget create(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeModel(),
      child: const HomePage(),
    );
  }

  static Widget createTitle(BuildContext context) =>
      Text(context.l10n.homeTitle);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    final model = context.read<HomeModel>();
    model.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Center();
  }
}
