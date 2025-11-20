import 'package:flutter/cupertino.dart';

import '../widgets/screensItem/home_screen_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const HomeScreenItem();
  }
}
