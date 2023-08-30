import 'package:flutter/material.dart';

import '../shared/components/constants.dart';

class setting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "setting",
          style: TextStyle(
            color: grey,
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        backgroundColor: white,
        iconTheme: const IconThemeData(color: grey),
      ),
    );
  }
}
