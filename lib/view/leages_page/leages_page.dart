import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football/controllers/main_cubit.dart';
import 'package:football/controllers/main_states.dart';
import 'package:football/models/leages_model.dart';

import '../../components/components.dart';

class LeagesPage extends StatelessWidget {
  const LeagesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
            MainCubit.get(context).leagesModel = null;
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: const CustomText(
          text: 'Choose a League to Show It\'s Teams',
          fontSized: 16,
          color: Colors.white,
        ),
      ),
      body: BlocConsumer<MainCubit, MainStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var c = MainCubit.get(context);
          return c.leagesModel == null
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: ListView.separated(
                    itemBuilder: (context, index) => BuildBlur(
                      sigmaX: 10,
                      sigmaY: 10,
                      widget: BuildLeageItem(
                        model: c.leagesModel!.response![index].league as League,
                      ),
                    ),
                    itemCount: c.leagesModel!.response!.length,
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 10,
                    ),
                  ),
                );
        },
      ),
    );
  }
}
