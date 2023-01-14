import 'package:flutter/material.dart';

import '../../../settings/constants.dart';

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
            padding: const EdgeInsets.fromLTRB(appDefaultSpace / 2,
                appDefaultSpace, appDefaultSpace / 2, appDefaultSpace),
            color: Colors.white,
            child: Text(
              "a MERN Stack & Flutter build project and employee management system",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 12.0,
                    color: const Color.fromRGBO(0, 0, 0, 0.87),
                    wordSpacing: 8,
                  ),
            ),
          ),
        ),
      ],
    );
  }
}
