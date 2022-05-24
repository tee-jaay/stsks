import 'package:flutter/material.dart';

class ContractStatus extends StatelessWidget {
  const ContractStatus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Contract status",
        style: TextStyle(
          color: Colors.white,
          fontSize: 24.0,
        ),
      ),
    );
  }
}
