abstract class MainStates {}

class InitialState extends MainStates {}

class GetCountriesSuccessState extends MainStates {}

class GetCountriesErrorState extends MainStates {
  String error;
  GetCountriesErrorState({required this.error});
}

class GetLeagesSuccessState extends MainStates {}

class GetLeagesErrorState extends MainStates {
  String error;
  GetLeagesErrorState({required this.error});
}

class GetTeamsSuccessState extends MainStates {}

class GetTeamsErrorState extends MainStates {
  String error;
  GetTeamsErrorState({required this.error});
}

class GetTeamsStatisticsSuccessState extends MainStates {}

class GetTeamsStatisticsErrorState extends MainStates {
  String error;
  GetTeamsStatisticsErrorState({required this.error});
}

class GetTeamsFixturesSuccessState extends MainStates {}

class GetTeamsFixturesErrorState extends MainStates {
  String error;
  GetTeamsFixturesErrorState({required this.error});
}

class GetTeamsPlayersSuccessState extends MainStates {}

class GetTeamsPlayersErrorState extends MainStates {
  String error;
  GetTeamsPlayersErrorState({required this.error});
}

class SearchAndFilter extends MainStates {}
