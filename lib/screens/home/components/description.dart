import 'package:flutter/material.dart';

import '../../../constants.dart';

class Description extends StatelessWidget {
  const Description({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.fromLTRB(stDefaultSpace / 2,
                stDefaultSpace, stDefaultSpace / 2, stDefaultSpace),
            color: Colors.white,
            child: const Text(
              "a MERN Stack powered project and employee management system.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12.0,
                color: Color.fromRGBO(0, 0, 0, 0.87),
                wordSpacing: 8,
              ),
            ),
          ),
        ),
      ],
    );
  }
}