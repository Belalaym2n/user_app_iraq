 import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../widgets/add_problem_item.dart';

class AddProblemScreen extends StatefulWidget {
  AddProblemScreen({super.key});

  @override
  State<AddProblemScreen> createState() => _AddProblemScreenState();
}

class _AddProblemScreenState extends State<AddProblemScreen> {
  TextEditingController problemController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return
              AddProblemItem(problemController: problemController);





  }
}
