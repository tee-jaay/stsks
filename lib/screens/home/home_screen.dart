import 'package:flutter/material.dart';
import 'package:stasks/constants.dart';
import 'package:stasks/models/Feature.dart';
import 'package:stasks/screens/dashboard/dashboard_screen.dart';

import 'components/description.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.appTitle}) : super(key: key);

  static String screenId = "home_screen";

  final String appTitle;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Hero(widget: widget),
          Description(),
          Column(
            children: [
              const FeaturesTitle(title: "Features"),
              Column(children: [
                SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Container(
                      color: stBackgroundColorLight,
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: List.generate(
                            dataFeatures.length,
                            (index) => (Padding(
                              padding: const EdgeInsets.all(stDefaultSpace / 4),
                              child: SizedBox(
                                height: 220,
                                width: 150.0,
                                child: Column(
                                  children: [
                                    Image.asset(
                                      dataFeatures[index].image,
                                      width:
                                          MediaQuery.of(context).size.width /
                                              2,
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
                                      height: stDefaultSpace,
                                    ),
                                  ],
                                ),
                              ),
                            )),
                          )),
                    )),
              ]),
            ],
          ),
        ],
      ),
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
              top: stDefaultSpace * 3, bottom: stDefaultSpace * 3),
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

class Hero extends StatelessWidget {
  const Hero({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final HomeScreen widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      color: const Color(0xFFf1f1f1),
      child: Center(
        child: TextButton(
          onPressed: () {
            Navigator.pushNamed(context, DashboardScreen.screenId);
          },
          child: Text(
            widget.appTitle.toUpperCase(),
            style: const TextStyle(
              color: Color.fromRGBO(76, 175, 80, 1),
              fontSize: 32.0,
            ),
          ),
        ),
      ),
    );
  }
}
