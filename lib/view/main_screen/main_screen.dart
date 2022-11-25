import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football/constans/constant.dart';
import 'package:football/controllers/main_cubit.dart';
import 'package:football/controllers/main_states.dart';

import '../../components/components.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            MainCubit.get(context).searchAndFilter('spain');
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        title: const CustomText(
          text: 'Choose Your Country',
          color: Colors.white,
        ),
        backgroundColor: primaryColor,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: CachedNetworkImageProvider(
                'https://thumbs.dreamstime.com/b/fit-woman-playing-soccer-ball-high-resolution-photo-fit-woman-playing-soccer-ball-high-quality-photo-231866983.jpg',
              ),
              fit: BoxFit.fill),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Column(
            children: [
              Expanded(
                child: BlocConsumer<MainCubit, MainStates>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      var c = MainCubit.get(context);
                      return c.countriesModel != null
                          ? Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Column(
                                children: [
                                  TextFormField(
                                    onChanged: (value) {
                                      c.searchAndFilter(c.searchValue.text);
                                    },
                                    decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                                      label: Text('Countrey Name'),
                                      hintText: 'Enter Countrey Name',
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(30),
                                      ),
                                      fillColor: Colors.white,
                                      filled: true,
                                    ),
                                    validator: (String? value) {
                                      if (value!.isEmpty) {
                                        return 'you must enter a country name';
                                      }
                                      return null;
                                    },
                                    controller: c.searchValue,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Expanded(
                                    child: GridView.count(
                                      crossAxisSpacing: 15,
                                      mainAxisSpacing: 15,
                                      childAspectRatio: 1 / 1.1,
                                      crossAxisCount: 2,
                                      children: List.generate(
                                        c.filteredList == null?
                                        c.countriesModel!.response!.length:c.filteredList!.length,
                                        (index) => BuildBlur(
                                          sigmaX: 8,
                                          sigmaY: 8,
                                          widget: BuildFlagItem(
                                            model:c.filteredList == null?  c.countriesModel!
                                                .response![index]:c.filteredList![index],
                                            index: index,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : const Center(
                              child: CircularProgressIndicator(),
                            );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
