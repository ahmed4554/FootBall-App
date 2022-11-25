import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football/controllers/main_cubit.dart';
import 'package:football/controllers/main_states.dart';
import 'package:football/models/players_model.dart';

import '../../components/components.dart';

class PlayersPage extends StatelessWidget {
  const PlayersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocConsumer<MainCubit, MainStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var c = MainCubit.get(context);
          return c.playersModel == null
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: GridView.count(
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                    childAspectRatio: 1 / 1.4,
                    crossAxisCount: 2,
                    children: List.generate(
                      c.teamsModel!.response!.length,
                      (index) => BuildPlayerItem(
                        model: c.playersModel!.response![index].player as Player,
                      ),
                    ),
                  ),
                );
        },
      ),
    );
  }
}
