import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football/controllers/main_cubit.dart';
import 'package:football/controllers/main_states.dart';
import 'package:football/models/teams_model.dart';

import '../../components/components.dart';

class TeamsPage extends StatelessWidget {
  TeamsPage({Key? key, required this.leageId}) : super(key: key);
  final int leageId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        title: const CustomText(
          text: 'Choose a Team to Show Statistics',
          fontSized: 16,
          color: Colors.white,
        ),
      ),
      body: BlocConsumer<MainCubit, MainStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var c = MainCubit.get(context);
          return c.teamsModel == null
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Expanded(
                    child: GridView.count(
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15,
                      childAspectRatio: 1 / 1.4,
                      crossAxisCount: 2,
                      children: List.generate(
                        c.teamsModel!.response!.length,
                        (index) => BuildTeamItem(
                          model:
                              c.teamsModel!.response![index].team as Team,
                          leageId: leageId,
                        ),
                      ),
                    ),
                  ),
                );
        },
      ),
    );
  }
}
