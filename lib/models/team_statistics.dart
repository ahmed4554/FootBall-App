class TeamStatistics {
  TeamStatistics({
    required this.get,
    required this.errors,
    required this.results,
    required this.response,
  });
  late final String get;
  late final List<dynamic> errors;
  late final int results;
  late final Response response;

  TeamStatistics.fromJson(Map<String, dynamic> json) {
    get = json['get'];
    errors = List.castFrom<dynamic, dynamic>(json['errors']);
    results = json['results'];
    response = Response.fromJson(json['response']);
  }
}

class Response {
  Response(
      {required this.team,
      required this.form,
      required this.fixtures,
      required this.goals});

  late final TeamStatisticsInfo team;
  late final String form;
  late final Fixtures fixtures;
  late final Goals goals;

  Response.fromJson(Map<String, dynamic> json) {
    team = TeamStatisticsInfo.fromJson(json['team']);
    form = json['form'];
    fixtures = Fixtures.fromJson(json['fixtures']);
    goals = Goals.fromJson(json['goals']);
  }
}

class TeamStatisticsInfo {
  late final int id;
  late final String name;
  late final String logo;

  TeamStatisticsInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    logo = json['logo'];
  }
}

class Fixtures {
  late final Played played;
  late final Wins wins;
  late final Draws draws;
  late final Loses loses;

  Fixtures.fromJson(Map<String, dynamic> json) {
    played = Played.fromJson(json['played']);
    wins = Wins.fromJson(json['wins']);
    draws = Draws.fromJson(json['draws']);
    loses = Loses.fromJson(json['loses']);
  }
}

class Played {
  late final int home;
  late final int away;
  late final int total;

  Played.fromJson(Map<String, dynamic> json) {
    home = json['home'];
    away = json['away'];
    total = json['total'];
  }
}

class Wins {
  late final int home;
  late final int away;
  late final int total;

  Wins.fromJson(Map<String, dynamic> json) {
    home = json['home'];
    away = json['away'];
    total = json['total'];
  }
}

class Draws {
  late final int home;
  late final int away;
  late final int total;

  Draws.fromJson(Map<String, dynamic> json) {
    home = json['home'];
    away = json['away'];
    total = json['total'];
  }
}

class Loses {
  late final int home;
  late final int away;
  late final int total;

  Loses.fromJson(Map<String, dynamic> json) {
    home = json['home'];
    away = json['away'];
    total = json['total'];
  }
}

class Goals {
  late final For goalFor;
  late final Against goalAgainst;

  Goals.fromJson(Map<String, dynamic> json) {
    goalFor = For.fromJson(json['for']);
    goalAgainst = Against.fromJson(json['against']);
  }
}

class For {
  For({
    required this.total,
    required this.average,
  });
  late final TotalFor total;
  late final Average average;

  For.fromJson(Map<String, dynamic> json) {
    total = TotalFor.fromJson(json['total']);
    average = Average.fromJson(json['average']);
  }
}

class TotalFor {
  late final int home;
  late final int away;
  late final int total;

  TotalFor.fromJson(Map<String, dynamic> json) {
    home = json['home'];
    away = json['away'];
    total = json['total'];
  }
}

class Average {
  late final String home;
  late final String away;
  late final String total;
  Average.fromJson(Map<String, dynamic> json) {
    home = json['home'];
    away = json['away'];
    total = json['total'];
  }
}

class Against {
  Against({
    required this.total,
    required this.average,
  });
  late final TotalFor total;
  late final Average average;

  Against.fromJson(Map<String, dynamic> json) {
    total = TotalFor.fromJson(json['total']);
    average = Average.fromJson(json['average']);
  }
}

class TotalAgainst {
  late final int home;
  late final int away;
  late final int total;

  TotalAgainst.fromJson(Map<String, dynamic> json) {
    home = json['home'];
    away = json['away'];
    total = json['total'];
  }
}

class AverageAgainst {
  late final String home;
  late final String away;
  late final String total;
  AverageAgainst.fromJson(Map<String, dynamic> json) {
    home = json['home'];
    away = json['away'];
    total = json['total'];
  }
}
