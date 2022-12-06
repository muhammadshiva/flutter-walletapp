import 'package:flutter/material.dart';

class MoneyPlannerEditPage extends StatefulWidget {
  const MoneyPlannerEditPage({Key? key}) : super(key: key);

  @override
  _MoneyPlannerEditPageState createState() => _MoneyPlannerEditPageState();
}

class _MoneyPlannerEditPageState extends State<MoneyPlannerEditPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit'),
      ),
    );
  }
}
