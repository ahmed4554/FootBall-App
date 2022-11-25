class CountriesModel {
  String? get;
  int? results;
  List<CountriesResponse>? response;

  CountriesModel.fromJson(Map<String, dynamic> json) {
    get = json['get'];
    results = json['results'];
    if (json['response'] != null) {
      response = <CountriesResponse>[];
      json['response'].forEach((v) {
        response!.add(CountriesResponse.fromJson(v));
      });
    }
  }
}

class CountriesResponse {
  String? name;
  String? code;
  String? flag;

  CountriesResponse({this.name, this.code, this.flag});

  CountriesResponse.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    code = json['code'];
    flag = json['flag'];
  }

}
