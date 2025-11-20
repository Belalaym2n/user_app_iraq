import 'package:flutter/cupertino.dart';

import '../widgets/loads_screens_item/loads_item.dart';

class AddLoadScreen extends StatefulWidget {
  const AddLoadScreen({super.key});

  @override
  State<AddLoadScreen> createState() => _AddLoadScreenState();
}

class _AddLoadScreenState extends State<AddLoadScreen> {
  @override
  Widget build(BuildContext context) {
    return LoadsItem();
  }
}
