import 'package:flutter/material.dart';

import '../../../settings/constants.dart';
import '../../../models/feature.dart';

class Features extends StatelessWidget {
  const Features({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const FeaturesTitle(title: "Features"),
        Column(children: [
          SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                color: appBackgroundColorLight,
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(
                      dataFeatures.length,
                          (index) => (Padding(
                        padding: const EdgeInsets.all(appDefaultSpace / 4),
                        child: SizedBox(
                          height: 220,
                          width: 150.0,
                          child: Column(
                            children: [
                              Image.asset(
                                dataFeatures[index].image,
                                width:
                                MediaQuery.of(context).size.width / 2,
                                height: 140,
                                fit: BoxFit.cover,
                              ),
                              Text(
                                dataFeatures[index].title,
                                style:
                                Theme.of(context).textTheme.bodyText1,
                              ),
                              Expanded(
                                child: Text(
                                  dataFeatures[index].subtitle,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2,
                                ),
                              ),
                              const SizedBox(
                                height: appDefaultSpace,
                              ),
                            ],
                          ),
                        ),
                      )),
                    )),
              )),
        ]),
      ],
    );
  }
}

class FeaturesTitle extends StatelessWidget {
  const FeaturesTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.only(
              top: appDefaultSpace * 3, bottom: appDefaultSpace * 3),
          color: const Color(0xFFf1f1f1),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(color: const Color.fromRGBO(0, 0, 0, 0.87)),
          ),
        ),
      ],
    );
  }
}