class PlayersModel {

      List<Response>? response;

  PlayersModel.fromJson(Map< String?, dynamic> json) {
    response =
        List.from(json['response']).map((e) => Response.fromJson(e)).toList();
  }

}





class Response {
      Player? player;
      List<Statistics>? statistics;

  Response.fromJson(Map< String, dynamic> json) {
    player = Player.fromJson(json['player']);
    statistics = List.from(json['statistics'])
        .map((e) => Statistics.fromJson(e))
        .toList();
  }
}

class Player {
    dynamic id;
     String? name;
     String? firstname;
     String? lastname;
    dynamic age;
    Birth? birth;
     String? nationality;
     String? height;
     String? weight;
    bool? injured;
     String? photo;

  Player.fromJson(Map< String?, dynamic> json) {
    id = json['id'];
    name = json['name'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    age = json['age'];
    birth = Birth.fromJson(json['birth']);
    nationality = json['nationality'];
    height = json['height'];
    weight = json['weight'];
    injured = json['injured'];
    photo = json['photo'];
  }
}

class Birth {
       String? date;
       String? place;
       String? country;

  Birth.fromJson(Map< String?, dynamic> json) {
    date = json['date'];
    place = json['place'];
    country = json['country'];
  }
}

class Statistics {

      Games? games;
      Substitutes? substitutes;
      Shots? shots;
      Goals? goals;
      Passes? passes;
      Tackles? tackles;
      Dribbles? dribbles;
      Fouls? fouls;
      Cards? cards;
      Penalty? penalty;

  Statistics.fromJson(Map< String, dynamic> json) {
    games = Games.fromJson(json['games']);
    substitutes = Substitutes.fromJson(json['substitutes']);
    shots = Shots.fromJson(json['shots']);
    goals = Goals.fromJson(json['goals']);
    passes = Passes.fromJson(json['passes']);
    tackles = Tackles.fromJson(json['tackles']);
    dribbles = Dribbles.fromJson(json['dribbles']);
    fouls = Fouls.fromJson(json['fouls']);
    cards = Cards.fromJson(json['cards']);
    penalty = Penalty.fromJson(json['penalty']);
  }
}

class Games {
      dynamic appearences;
      dynamic lineups;
      dynamic minutes;
       String? position;
       String? rating;
      bool? captain;

  Games.fromJson(Map< String, dynamic> json) {
    appearences = json['appearences'];
    lineups = json['lineups'];
    minutes = json['minutes'];
    position = json['position'];
    rating = json['rating'];
    captain = json['captain'];
  }
}

class Substitutes {
  Substitutes({
    required this.inner,
    required this.out,
    required this.bench,
  });
      dynamic inner;
      dynamic out;
      dynamic bench;

  Substitutes.fromJson(Map< String, dynamic> json) {
    inner = json['in'];
    out = json['out'];
    bench = json['bench'];
  }


}

class Shots {
  Shots({
    required this.total,
    required this.on,
  });
      dynamic total;
      dynamic on;

  Shots.fromJson(Map< String, dynamic> json) {
    total = json['total'];
    on = json['on'];
  }
}

class Goals {
  Goals({
    required this.total,
    required this.assists,
    required this.saves,
  });
      dynamic total;
      dynamic assists;
      dynamic saves;

  Goals.fromJson(Map< String, dynamic> json) {
    total = json['total'];
    assists = json['assists'];
    saves = json['saves'];
  }

}

class Passes {
  Passes({
    required this.total,
    required this.key,
    required this.accuracy,
  });
      dynamic total;
      dynamic key;
      dynamic accuracy;

  Passes.fromJson(Map< String, dynamic> json) {
    total = json['total'];
    key = json['key'];
    accuracy = json['accuracy'];
  }

}

class Tackles {
      dynamic total;
      dynamic blocks;
      dynamic dynamicerceptions;

  Tackles.fromJson(Map< String?, dynamic> json) {
    total = json['total'];
    blocks = json['blocks'];
    dynamicerceptions = json['dynamicerceptions'];
  }
}

class Dribbles {
      dynamic attempts;
      dynamic success;

  Dribbles.fromJson(Map< String?, dynamic> json) {
    attempts = json['attempts'];
    success = json['success'];
  }
}

class Fouls {
      dynamic drawn;
      dynamic committed;

  Fouls.fromJson(Map< String?, dynamic> json) {
    drawn = json['drawn'];
    committed = json['committed'];
  }
}

class Cards {
      dynamic yellow;
      dynamic yellowred;
      dynamic red;

  Cards.fromJson(Map< String?, dynamic> json) {
    yellow = json['yellow'];
    yellowred = json['yellowred'];
    red = json['red'];
  }
}

class Penalty {
      dynamic won;
      dynamic scored;
      dynamic missed;

  Penalty.fromJson(Map< String?, dynamic> json) {
    won = json['won'];
    scored = json['scored'];
    missed = json['missed'];
  }
}
