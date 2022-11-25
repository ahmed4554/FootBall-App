class LeagesModel {
  String? get;
  int? results;
  List<LeagesResponse>? response;

  LeagesModel.fromJson(Map<String, dynamic> json) {
    get = json['get'];
    results = json['results'];
    if (json['response'] != null) {
      response = <LeagesResponse>[];
      json['response'].forEach((v) {
        response!.add(LeagesResponse.fromJson(v));
      });
    }
  }
}

class LeagesResponse {
  League? league;
  List<Seasons>? seasons;

  LeagesResponse.fromJson(Map<String, dynamic> json) {
    league =
        json['league'] != null ?  League.fromJson(json['league']) : null;
    if (json['seasons'] != null) {
      seasons = <Seasons>[];
      json['seasons'].forEach((v) {
        seasons!.add(Seasons.fromJson(v));
      });
    }
  }
}

class League {
  int? id;
  String? name;
  String? type;
  String? logo;

  League.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    type = json['type'];
    logo = json['logo'];
  }
}

class Seasons {
  int? year;
  String? start;
  String? end;
  bool? current;
  Coverage? coverage;
  Seasons.fromJson(Map<String, dynamic> json) {
    year = json['year'];
    start = json['start'];
    end = json['end'];
    current = json['current'];
    coverage = json['coverage'] != null
        ? new Coverage.fromJson(json['coverage'])
        : null;
  }
}

class Coverage {
  Fixtures? fixtures;
  bool? standings;
  bool? players;
  bool? topScorers;
  bool? topAssists;
  bool? topCards;
  bool? injuries;
  bool? predictions;
  bool? odds;

  Coverage.fromJson(Map<String, dynamic> json) {
    fixtures = json['fixtures'] != null
        ? new Fixtures.fromJson(json['fixtures'])
        : null;
    standings = json['standings'];
    players = json['players'];
    topScorers = json['top_scorers'];
    topAssists = json['top_assists'];
    topCards = json['top_cards'];
    injuries = json['injuries'];
    predictions = json['predictions'];
    odds = json['odds'];
  }
}

class Fixtures {
  bool? events;
  bool? lineups;
  bool? statisticsFixtures;
  bool? statisticsPlayers;

  Fixtures.fromJson(Map<String, dynamic> json) {
    events = json['events'];
    lineups = json['lineups'];
    statisticsFixtures = json['statistics_fixtures'];
    statisticsPlayers = json['statistics_players'];
  }
}
