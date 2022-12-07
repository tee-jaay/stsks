import 'package:flutter/material.dart';

import '../../../constants.dart';
import 'section_title.dart';


class TechsUsed extends StatelessWidget {
  final List<String> _techNames = [
    'mern',
    'flutter',
  ];

  TechsUsed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: stDefaultSpace,
            vertical: stDefaultSpace * 2,
          ),
          child: Column(
            children: [
              const SectionTitle(
                title: "Techs",
              ),
              const SizedBox(
                height: stDefaultSpace * 4,
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    _techNames.length,
                    (index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Chip(
                        padding: const EdgeInsets.all(0),
                        backgroundColor: const Color(0xff2E2E2E),
                        label: Text(
                          _techNames[index],
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                  ),
                  // [

                  // Spacer(),
                  // customTechChip(
                  //   text: "flutter",
                  // ),
                  // ],
                ),
              ),
              const SizedBox(
                height: stDefaultSpace * 4,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomTechChip extends StatelessWidget {
  const CustomTechChip({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        color: const Color(0xff2e2e2e),
      ),
      child: Text(
        text,
        style: Theme.of(context)
            .textTheme
            .bodySmall!
            .copyWith(color: Colors.white),
      ),
    );
  }
}
