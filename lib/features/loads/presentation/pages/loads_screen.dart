import 'package:flutter/cupertino.dart';
import 'package:user_app_iraq/features/loads/presentation/widgets/loads_screens/loads_screen_item.dart';

class LoadsScreen extends StatefulWidget {
  const LoadsScreen({super.key});

  @override
  State<LoadsScreen> createState() => _LoadsScreenState();
}

class _LoadsScreenState extends State<LoadsScreen> {
  @override
  Widget build(BuildContext context) {
    return const LoadsScreenItem();
  }
}
