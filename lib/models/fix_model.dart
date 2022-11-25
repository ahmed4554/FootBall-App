class FixturesModel {
  String? get;
  int? results;
  List<FixResponse>? response;

  FixturesModel.fromJson(Map<String, dynamic> json) {
    get = json['get'];

    results = json['results'];

    if (json['response'] != null) {
      response = <FixResponse>[];
      json['response'].forEach((v) {
        response!.add(FixResponse.fromJson(v));
      });
    }
  }
}

class FixResponse {
  Fixture? fixture;
  Teams? teams;
  Goals? goals;

  FixResponse.fromJson(Map<String, dynamic> json) {
    fixture =
        json['fixture'] != null ?  Fixture.fromJson(json['fixture']) : null;

    teams = json['teams'] != null ?  Teams.fromJson(json['teams']) : null;
    goals = json['goals'] != null ?  Goals.fromJson(json['goals']) : null;
  }
}

class Fixture {
  int? id;
  String? timezone;
  String? date;
  int? timestamp;
  Venue? venue;

  Fixture.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    timezone = json['timezone'];
    date = json['date'];
    timestamp = json['timestamp'];
    venue = json['venue'] != null ? Venue.fromJson(json['venue']) : null;
  }
}

class Venue {
  int? id;
  String? name;
  String? city;

  Venue.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    city = json['city'];
  }
}

class Teams {
  Home? home;
  Away? away;

  Teams({this.home, this.away});

  Teams.fromJson(Map<String, dynamic> json) {
    home = json['home'] != null ?  Home.fromJson(json['home']) : null;
    away = json['away'] != null ?  Away.fromJson(json['away']) : null;
  }
}

class Home {
  int? id;
  String? name;
  String? logo;
  bool? winner;

  Home.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    logo = json['logo'];
    winner = json['winner'];
  }
}
class Away {
  int? id;
  String? name;
  String? logo;
  bool? winner;

  Away.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    logo = json['logo'];
    winner = json['winner'];
  }
}

class Goals {
  int? home;
  int? away;

  Goals.fromJson(Map<String, dynamic> json) {
    home = json['home']??0;
    away = json['away']??0;
  }
}

