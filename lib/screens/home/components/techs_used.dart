import 'package:flutter/material.dart';
import 'package:badges/badges.dart';

import 'package:stasks/constants.dart';

import 'package:stasks/screens/home/components/section_title.dart';

class TechsUsed extends StatelessWidget {
  final List<String> _techNames = [
    'flutter',
    'express.js',
    'react.js',
    'mongoDb',
  ];

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: stDefaultSpace,
            vertical: stDefaultSpace * 2,
          ),
          child: Column(
            children: [
              Container(
                child: SectionTitle(
                  title: "Techs used",
                ),
              ),
              SizedBox(
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
                        padding: EdgeInsets.all(0),
                        backgroundColor: Color(0xff2E2E2E),
                        label: Text(
                          _techNames[index],
                          style: TextStyle(
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
              SizedBox(
                height: stDefaultSpace * 4,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class customTechChip extends StatelessWidget {
  const customTechChip({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        color: Color(0xff2e2e2e),
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
