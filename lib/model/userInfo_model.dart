class UserInfoModel {
  String? time;
  int? mmr;
  String? nickName;
  int? rank;
  int? rankSize;
  int? totalGames;
  int? totalWins;
  int? totalTeamKills;
  int? totalDeaths;
  int? escapeCount;
  double? rankPercent;
  double? averageRank;
  double? averageKills;
  double? averageAssistants;
  double? averageHunts;
  int? top1;
  int? top2;
  int? top3;
  int? top5;
  int? top7;

  UserInfoModel({
    this.time,
    this.mmr,
    this.nickName,
    this.rank,
    this.rankSize,
    this.totalGames,
    this.totalWins,
    this.totalTeamKills,
    this.totalDeaths,
    this.escapeCount,
    this.rankPercent,
    this.averageRank,
    this.averageKills,
    this.averageAssistants,
    this.averageHunts,
    this.top1,
    this.top2,
    this.top3,
    this.top5,
    this.top7,
  });

  UserInfoModel.fromJson(Map<String, dynamic> json) {
    time = json['time'];
    mmr = json['mmr'];
    nickName = json['nickName'];
    rank = json['rank'];
    rankSize = json['rankSize'];
    totalGames = json['totalGames'];
    totalWins = json['totalWins'];
    totalTeamKills = json['totalTeamKills'];
    totalDeaths = json['totalDeaths'];
    escapeCount = json['escapeCount'];
    rankPercent = (json['rankPercent'] as num?)?.toDouble();
    averageRank = (json['averageRank'] as num?)?.toDouble();
    averageKills = (json['averageKills'] as num?)?.toDouble();
    averageAssistants = (json['averageAssistants'] as num?)?.toDouble();
    averageHunts = (json['averageHunts'] as num?)?.toDouble();
    top1 = json['top1'];
    top2 = json['top2'];
    top3 = json['top3'];
    top5 = json['top5'];
    top7 = json['top7'];
  }
}

class UserInfo {
  int? id;
  DateTime? time;
  List<UserInfoModel>? userStats;

  UserInfo({
    this.id,
    this.time,
    this.userStats,
  });

  UserInfo.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    time = json['time'] != null ? DateTime.parse(json['time']) : null;
    userStats = json['userStats'] != null
        ? json['userStats']
            .map<UserInfoModel>((model) => UserInfoModel.fromJson(model))
            .toList()
        : [];
  }
}
