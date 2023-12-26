class matchModel {
  int? id;
  String? homeTeam;
  String? awayTeam;
  String? date;
  String? time;
  String? referee;
  String? linesman1;
  String? linesman2;
  String? homeTeamImg;
  String? awayTeamImg;

  matchModel(
      {this.id,
      this.homeTeam,
      this.awayTeam,
      this.date,
      this.time,
      this.homeTeamImg,
      this.awayTeamImg,
      this.referee,
      this.linesman1,
      this.linesman2});

  matchModel.fromJson(Map<dynamic, dynamic> json) {
    id = json['id'];
    homeTeam = json['homeTeam'];
    awayTeam = json['awayTeam'];
    date = json['date'];
    time = json['time'];
    referee = json['referee'];
    linesman1 = json['linesman1'];
    linesman2 = json['linesman2'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'id': id,
      'homeTeam': homeTeam,
      'awayTeam': awayTeam,
      'date': date,
      'time': time,
      'referee': referee,
      'linesman1': linesman1,
      'linesman2': linesman2
    };
    return data;
  }
}
