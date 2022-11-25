import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:football/controllers/main_cubit.dart';
import 'package:football/models/countries_model.dart';
import 'package:football/models/fix_model.dart';
import 'package:football/models/leages_model.dart';
import 'package:football/models/teams_model.dart';
import 'package:football/view/leages_page/leages_page.dart';
import '../constans/constant.dart';
import '../models/players_model.dart';
import '../view/team_statistics/team_statistics_page.dart';
import '../view/teams_page/teams_page.dart';

class BuildFlagItem extends StatelessWidget {
  BuildFlagItem({Key? key, required this.index, required this.model})
      : super(key: key);
  int index = 0;
  CountriesResponse model;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        MainCubit.get(context).getleages(model.name.toString());
        navigateTo(context, page: LeagesPage());
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(.6),
        ),
        child: Column(
          children: [
            SvgPicture.network(
              model.flag.toString(),
              fit: BoxFit.fill,
              height: MediaQuery.of(context).size.height * .18,
              width: double.infinity,
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: CustomText(
                text: model.name.toString() == 'Israel'
                    ? 'Nothing'
                    : model.name.toString(),
                alignment: Alignment.center,
                fontSized: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BuildLeageItem extends StatelessWidget {
  const BuildLeageItem({Key? key, required this.model}) : super(key: key);
  final League model;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        MainCubit.get(context).getTeams(model.id as int);
        navigateTo(context, page: TeamsPage(leageId: model.id as int));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        alignment: Alignment.center,
        height: 150,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(.4),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CachedNetworkImage(
              imageUrl: model.logo.toString(),
              fit: BoxFit.fill,
              height: 150,
              width: 150,
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: CustomText(
                text: model.name.toString(),
                alignment: Alignment.center,
                fontSized: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BuildTeamItem extends StatelessWidget {
  const BuildTeamItem({
    Key? key,
    required this.model,
    required this.leageId,
  }) : super(key: key);
  final Team model;
  final int leageId;
  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    var season = TextEditingController();
    return InkWell(
      onTap: () {
        if (formKey.currentState!.validate()) {
          MainCubit.get(context).getTeamStatistics(
              leageId, model.id as int, season.text, context);
          MainCubit.get(context).getPlayersOfTeam(model.id as int, season.text);
          navigateTo(context, page: const TeamStatisticsPage());
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        alignment: Alignment.center,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(.4),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            CachedNetworkImage(
              imageUrl: model.logo.toString(),
              height: 130,
              fit: BoxFit.fill,
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: Form(
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      CustomText(
                        text: model.name.toString(),
                        maxLines: 1,
                        textOverflow: TextOverflow.ellipsis,
                        alignment: Alignment.bottomCenter,
                        fontSized: 18,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter a season';
                          }
                        },
                        controller: season,
                        decoration: InputDecoration(
                          fillColor: Colors.white38,
                          filled: true,
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 10),
                          label: const Text('Season'),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                            borderSide: const BorderSide(
                              color: Colors.black38,
                              width: 1,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BuildFixturesItem extends StatelessWidget {
  const BuildFixturesItem({Key? key, required this.fixResponse})
      : super(key: key);
  final FixResponse fixResponse;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(10),
          width: double.infinity,
          height: 210,
          child: Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CachedNetworkImage(
                      imageUrl: fixResponse.teams!.home!.logo.toString(),
                      height: 100,
                      width: 100,
                      fit: BoxFit.fill,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      fixResponse.teams!.home!.name.toString(),
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                fixResponse.goals!.home.toString(),
                style: TextStyle(
                    color: fixResponse.goals!.home! < fixResponse.goals!.away!
                        ? Colors.white.withOpacity(.5)
                        : Colors.black,
                    fontSize: 28,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                width: 25,
                child: Text(
                  '-',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 28,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                fixResponse.goals!.away.toString(),
                style: TextStyle(
                    color: fixResponse.goals!.away! < fixResponse.goals!.home!
                        ? Colors.white.withOpacity(.5)
                        : Colors.black,
                    fontSize: 28,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CachedNetworkImage(
                      imageUrl: fixResponse.teams!.away!.logo.toString(),
                      height: 100,
                      width: 100,
                      fit: BoxFit.fill,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      fixResponse.teams!.away!.name.toString(),
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 0,
          left: (MediaQuery.of(context).size.width * .5) - 60,
          right: (MediaQuery.of(context).size.width * .5) - 60,
          child: Container(
            alignment: Alignment.center,
            width: 60,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.green[400],
              boxShadow: const [
                BoxShadow(
                    blurRadius: 7,
                    spreadRadius: 1,
                    color: Colors.black38,
                    offset: Offset(0, 5)),
              ],
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Text(
              fixResponse.fixture!.date.toString().substring(0, 10),
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
}

class BuildPlayerItem extends StatelessWidget {
  const BuildPlayerItem({Key? key, required this.model}) : super(key: key);
  final Player model;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(.6),
        ),
        child: Column(
          children: [
            CachedNetworkImage(
              imageUrl:model.photo.toString(),
              fit: BoxFit.fill,
              height: MediaQuery.of(context).size.height * .23,
              width: double.infinity,
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: CustomText(
                text: model.name.toString(),
                alignment: Alignment.center,
                fontSized: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BuildBlur extends StatelessWidget {
  const BuildBlur(
      {Key? key,
      required this.sigmaX,
      required this.sigmaY,
      required this.widget})
      : super(key: key);
  final double sigmaX;
  final double sigmaY;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(7),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: sigmaX,
          sigmaY: sigmaY,
        ),
        child: widget,
      ),
    );
  }
}

class CustomText extends StatelessWidget {
  final String text;
  final double fontSized;
  final Color color;
  final FontWeight fontWeight;
  final Alignment alignment;
  final double width;
  final int maxLines;
  final TextOverflow textOverflow;
  const CustomText(
      {this.color = Colors.black,
      this.fontSized = 14,
      this.maxLines = 1000,
      this.textOverflow = TextOverflow.visible,
      this.fontWeight = FontWeight.bold,
      this.text = '',
      this.alignment = Alignment.centerLeft,
      this.width = double.infinity});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      alignment: alignment,
      child: Text(
        text,
        maxLines: maxLines,
        overflow: textOverflow,
        style: TextStyle(
          fontSize: fontSized,
          fontWeight: fontWeight,
          color: color,
        ),
      ),
    );
  }
}

class CustomFormField extends StatelessWidget {
  const CustomFormField(
      {Key? key,
      this.controller,
      this.label = '',
      required this.validator,
      required this.onSaved,
      this.hintText = ''})
      : super(key: key);

  final String label;
  final String hintText;
  final TextEditingController? controller;
  final dynamic onSaved;
  final dynamic validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onSaved: onSaved,
      validator: validator,
      decoration: InputDecoration(
        label: CustomText(text: label),
        hintText: hintText,
        labelStyle: const TextStyle(
          fontSize: 18,
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton(
      {Key? key,
      required this.label,
      this.backgrounColor = primaryColor,
      required this.onPressed})
      : super(key: key);

  final String label;
  final Color backgrounColor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 50,
      color: backgrounColor,
      onPressed: onPressed,
      child: CustomText(
        alignment: Alignment.center,
        text: label,
        color: Colors.white,
      ),
    );
  }
}

class BuildTeamStatisticsRow extends StatelessWidget {
  const BuildTeamStatisticsRow({
    Key? key,
    required this.rowTitle,
    required this.sum,
    required this.away,
    required this.home,
  }) : super(key: key);
  final String rowTitle;
  final String home, away, sum;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        border: const Border(
          top: BorderSide(color: Colors.black26, width: 1),
          bottom: BorderSide(color: Colors.black26, width: 1),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 150,
            child: CustomText(
              alignment: Alignment.centerLeft,
              text: rowTitle,
              fontSized: 16,
              color: Colors.red[400] as Color,
            ),
          ),
          Expanded(
            child: CustomText(
              alignment: Alignment.center,
              text: home.toString(),
            ),
          ),
          Expanded(
            child: CustomText(
              alignment: Alignment.center,
              text: away.toString(),
            ),
          ),
          Expanded(
            child: CustomText(
              alignment: Alignment.center,
              text: sum.toString(),
              color: Colors.green[500] as Color,
            ),
          ),
        ],
      ),
    );
  }
}

class BuildTeamStatisticsRowTitle extends StatelessWidget {
  const BuildTeamStatisticsRowTitle({Key? key, required this.title})
      : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        border: const Border(
          top: BorderSide(color: Colors.black26, width: 1),
          bottom: BorderSide(color: Colors.black26, width: 1),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: CustomText(
              alignment: Alignment.centerLeft,
              text: title,
              fontSized: 18,
            ),
          ),
        ],
      ),
    );
  }
}

void navigateTo(context, {required Widget page}) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => page));
}
