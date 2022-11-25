class TeamsModel {
  String? get;
  int? results;
  List<TeamsResponse>? response;

  TeamsModel.fromJson(Map<String, dynamic> json) {
    get = json['get'];
    results = json['results'];
    if (json['response'] != null) {
      response = <TeamsResponse>[];
      json['response'].forEach((v) {
        response!.add(TeamsResponse.fromJson(v));
      });
    }
  }
}

class TeamsResponse {
  Team? team;
  Venue? venue;
  TeamsResponse.fromJson(Map<String, dynamic> json) {
    team = json['team'] != null ?  Team.fromJson(json['team']) : null;
    venue = json['venue'] != null ?  Venue.fromJson(json['venue']) : null;
  }
}

class Team {
  int? id;
  String? name;
  String? code;
  String? country;
  int? founded;
  bool? national;
  String? logo;
  Team.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    code = json['code'];
    country = json['country'];
    founded = json['founded'];
    national = json['national'];
    logo = json['logo'];
  }
}

class Venue {
  int? id;
  String? name;
  String? address;
  String? city;
  int? capacity;
  String? surface;
  String? image;

  Venue.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    address = json['address'];
    city = json['city'];
    capacity = json['capacity'];
    surface = json['surface'];
    image = json['image'];
  }
}
