import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football/controllers/main_states.dart';
import 'package:football/dio_helper/dio_helper.dart';
import 'package:football/end_points/end_points.dart';
import 'package:football/models/countries_model.dart';
import 'package:football/models/leages_model.dart';
import 'package:football/models/players_model.dart';
import 'package:football/models/teams_model.dart';
import '../models/fix_model.dart';
import '../models/team_statistics.dart';

class MainCubit extends Cubit<MainStates> {
  MainCubit() : super(InitialState());
  static MainCubit get(context) => BlocProvider.of(context);
  CountriesModel? countriesModel;
  List<CountriesResponse>? filteredList;
  var searchValue = TextEditingController();

  void getCountries() async {
    await DioHelper.getData(endpoint: COUNTRIES).then((value) {
      countriesModel = CountriesModel.fromJson(value.data);
      emit(GetCountriesSuccessState());
    }).catchError((e) {
      emit(GetCountriesErrorState(error: e.toString()));
    });
  }

  void searchAndFilter(String query) {
    filteredList = countriesModel!.response!.where((element) {
      final countryName = element.name!.toLowerCase();
      return countryName.contains(query.toLowerCase());
    }).toList();
    emit(SearchAndFilter());
    log(filteredList![0].name.toString());
  }

  LeagesModel? leagesModel;

  void getleages(String countryName) async {
    await DioHelper.getData(endpoint: LEAGES, query: {'country': countryName})
        .then((value) {
      leagesModel = LeagesModel.fromJson(value.data);
      emit(GetLeagesSuccessState());
    }).catchError((e) {
      emit(GetLeagesErrorState(error: e.toString()));
    });
  }

  TeamsModel? teamsModel;

  void getTeams(int leageId) async {
    await DioHelper.getData(
        endpoint: TEAMS,
        query: {'league': leageId, 'season': 2021}).then((value) {
      teamsModel = TeamsModel.fromJson(value.data);
      log(value.data.toString());
      emit(GetTeamsSuccessState());
    }).catchError((e) {
      emit(GetTeamsErrorState(error: e.toString()));
    });
  }

  TeamStatistics? teamStatistics;
  void getTeamStatistics(
      int LeageId, int teamId, String season, context) async {
    await DioHelper.getData(endpoint: STATISTICS, query: {
      'league': LeageId,
      'season': int.parse(season),
      'team': teamId,
    }).then((value) {
      teamStatistics = TeamStatistics.fromJson(value.data);
      emit(GetTeamsStatisticsSuccessState());
      getFixturesOfTeam(teamId, season);
    }).catchError((e) {
      emit(GetTeamsStatisticsErrorState(error: e.toString()));
    });
  }

  FixturesModel? fixturesModel;

  void getFixturesOfTeam(int teamId, String season) async {
    await DioHelper.getData(
        endpoint: FIXTURES,
        query: {'team': teamId, 'season': int.parse(season)}).then((value) {
      fixturesModel = FixturesModel.fromJson(value.data);
      emit(GetTeamsFixturesSuccessState());
    }).catchError((e) {
      emit(GetTeamsFixturesErrorState(error: e.toString()));
    });
  }

  PlayersModel? playersModel;
  void getPlayersOfTeam(int teamId, String season) async {
    await DioHelper.getData(
        endpoint: PLAYERS,
        query: {'team': teamId, 'season': int.parse(season)}).then((value) {
      playersModel = PlayersModel.fromJson(value.data);
      emit(GetTeamsPlayersSuccessState());
    }).catchError((e) {
      emit(GetTeamsPlayersErrorState(error: e.toString()));
      log(e.toString());
    });
  }
}
