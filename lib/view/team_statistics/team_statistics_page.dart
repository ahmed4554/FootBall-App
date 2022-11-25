import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football/controllers/main_states.dart';
import 'package:football/view/players_page/Players_page.dart';

import '../../components/components.dart';
import '../../controllers/main_cubit.dart';

class TeamStatisticsPage extends StatelessWidget {
  const TeamStatisticsPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var c = MainCubit.get(context);
        return c.teamStatistics == null || c.fixturesModel == null
            ? const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  leading: IconButton(
                    color: Colors.black,
                    onPressed: () {
                      Navigator.pop(context);
                      MainCubit.get(context).teamStatistics = null;
                    },
                    icon: const Icon(Icons.arrow_back_ios),
                  ),
                  title: CustomText(
                    text: c.teamStatistics!.response.team.name,
                    fontSized: 16,
                  ),
                  actions: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: CachedNetworkImage(
                        imageUrl: c.teamStatistics!.response.team.logo,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ],
                ),
                body: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            border: const Border(
                              top: BorderSide(color: Colors.black26, width: 1),
                              bottom:
                                  BorderSide(color: Colors.black26, width: 1),
                            ),
                          ),
                          child: Row(
                            children: const [
                              SizedBox(
                                width: 150,
                              ),
                              Expanded(
                                child: CustomText(
                                  alignment: Alignment.center,
                                  text: 'HOME',
                                  fontSized: 18,
                                ),
                              ),
                              Expanded(
                                child: CustomText(
                                  alignment: Alignment.center,
                                  text: 'AWAY',
                                  fontSized: 18,
                                ),
                              ),
                              Expanded(
                                child: CustomText(
                                  alignment: Alignment.center,
                                  text: 'ALL',
                                  fontSized: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                        BuildTeamStatisticsRow(
                          rowTitle: 'Game Played',
                          home: MainCubit.get(context)
                              .teamStatistics!
                              .response
                              .fixtures
                              .played
                              .home
                              .toString(),
                          away: MainCubit.get(context)
                              .teamStatistics!
                              .response
                              .fixtures
                              .played
                              .away
                              .toString(),
                          sum: MainCubit.get(context)
                              .teamStatistics!
                              .response
                              .fixtures
                              .played
                              .total
                              .toString(),
                        ),
                        BuildTeamStatisticsRow(
                          rowTitle: 'Wins',
                          home: MainCubit.get(context)
                              .teamStatistics!
                              .response
                              .fixtures
                              .wins
                              .home
                              .toString(),
                          away: MainCubit.get(context)
                              .teamStatistics!
                              .response
                              .fixtures
                              .wins
                              .away
                              .toString(),
                          sum: MainCubit.get(context)
                              .teamStatistics!
                              .response
                              .fixtures
                              .wins
                              .total
                              .toString(),
                        ),
                        BuildTeamStatisticsRow(
                          rowTitle: 'Draws',
                          home: MainCubit.get(context)
                              .teamStatistics!
                              .response
                              .fixtures
                              .draws
                              .home
                              .toString(),
                          away: MainCubit.get(context)
                              .teamStatistics!
                              .response
                              .fixtures
                              .draws
                              .away
                              .toString(),
                          sum: MainCubit.get(context)
                              .teamStatistics!
                              .response
                              .fixtures
                              .draws
                              .total
                              .toString(),
                        ),
                        BuildTeamStatisticsRow(
                          rowTitle: 'Loses',
                          home: MainCubit.get(context)
                              .teamStatistics!
                              .response
                              .fixtures
                              .loses
                              .home
                              .toString(),
                          away: MainCubit.get(context)
                              .teamStatistics!
                              .response
                              .fixtures
                              .loses
                              .away
                              .toString(),
                          sum: MainCubit.get(context)
                              .teamStatistics!
                              .response
                              .fixtures
                              .loses
                              .total
                              .toString(),
                        ),
                        const BuildTeamStatisticsRowTitle(
                          title: 'Goals',
                        ),
                        BuildTeamStatisticsRow(
                            rowTitle: 'Goals For',
                            sum: MainCubit.get(context)
                                .teamStatistics!
                                .response
                                .goals
                                .goalFor
                                .total
                                .total
                                .toString(),
                            away: MainCubit.get(context)
                                .teamStatistics!
                                .response
                                .goals
                                .goalFor
                                .total
                                .away
                                .toString(),
                            home: MainCubit.get(context)
                                .teamStatistics!
                                .response
                                .goals
                                .goalFor
                                .total
                                .home
                                .toString()),
                        BuildTeamStatisticsRow(
                            rowTitle: 'Goals Against',
                            sum: MainCubit.get(context)
                                .teamStatistics!
                                .response
                                .goals
                                .goalAgainst
                                .total
                                .total
                                .toString(),
                            away: MainCubit.get(context)
                                .teamStatistics!
                                .response
                                .goals
                                .goalAgainst
                                .total
                                .away
                                .toString(),
                            home: MainCubit.get(context)
                                .teamStatistics!
                                .response
                                .goals
                                .goalAgainst
                                .total
                                .home
                                .toString()),
                        const BuildTeamStatisticsRowTitle(
                          title: 'Goals Avarage',
                        ),
                        BuildTeamStatisticsRow(
                            rowTitle: 'Goals For',
                            sum: MainCubit.get(context)
                                .teamStatistics!
                                .response
                                .goals
                                .goalFor
                                .average
                                .total
                                .toString(),
                            away: MainCubit.get(context)
                                .teamStatistics!
                                .response
                                .goals
                                .goalFor
                                .average
                                .away
                                .toString(),
                            home: MainCubit.get(context)
                                .teamStatistics!
                                .response
                                .goals
                                .goalFor
                                .average
                                .home
                                .toString()),
                        BuildTeamStatisticsRow(
                            rowTitle: 'Goals Against',
                            sum: MainCubit.get(context)
                                .teamStatistics!
                                .response
                                .goals
                                .goalAgainst
                                .average
                                .total
                                .toString(),
                            away: MainCubit.get(context)
                                .teamStatistics!
                                .response
                                .goals
                                .goalAgainst
                                .average
                                .away
                                .toString(),
                            home: MainCubit.get(context)
                                .teamStatistics!
                                .response
                                .goals
                                .goalAgainst
                                .average
                                .home
                                .toString()),
                        const SizedBox(
                          height: 10,
                        ),
                        MaterialButton(
                          onPressed: () {
                            navigateTo(context, page: const PlayersPage());
                          },
                          child: const Text('press to show Players'),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(25),
                              topRight: Radius.circular(25),
                            ),
                            color: Colors.blueAccent,
                          ),
                          child: ListView.separated(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return BuildFixturesItem(
                                    fixResponse:
                                        c.fixturesModel!.response![index]);
                              },
                              separatorBuilder: (context, index) => Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Colors.grey[300],
                                      border: const Border(
                                        bottom: BorderSide(width: 1),
                                      ),
                                    ),
                                  ),
                              itemCount: c.fixturesModel!.response!.length),
                        ),
                      ],
                    ),
                  ),
                ),
              );
      },
    );
  }
}
