class UserInfoModel {
  late int iId;
  late String time;
  late int iV;
  late List<UserStats> userStats;

  UserInfoModel(
      {required this.iId,
      required this.time,
      required this.iV,
      required this.userStats});

  UserInfoModel.fromJson(Map<String, dynamic> json) {
    iId = json['_id'];
    time = json['time'];
    iV = json['__v'];
    if (json['userStats'] != null) {
      userStats = <UserStats>[];
      json['userStats'].forEach((v) {
        userStats.add(UserStats.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = iId;
    data['time'] = time;
    data['__v'] = iV;
    data['userStats'] = userStats.map((v) => v.toJson()).toList();
    return data;
  }
}

class UserStats {
  late int mmr;
  late int rank;
  late int rankSize;
  late int totalGames;
  late int totalWins;
  late int totalTeamKills;
  late int totalDeaths;
  late int escapeCount;
  late double rankPercent;
  late double averageRank;
  late double averageKills;
  late double averageAssistants;
  late double averageHunts;
  late double top1;
  late double top2;
  late double top3;
  late double top5;
  late double top7;
  late String sId;

  UserStats(
      {required this.mmr,
      required this.rank,
      required this.rankSize,
      required this.totalGames,
      required this.totalWins,
      required this.totalTeamKills,
      required this.totalDeaths,
      required this.escapeCount,
      required this.rankPercent,
      required this.averageRank,
      required this.averageKills,
      required this.averageAssistants,
      required this.averageHunts,
      required this.top1,
      required this.top2,
      required this.top3,
      required this.top5,
      required this.top7,
      required this.sId});

  UserStats.fromJson(Map<String, dynamic> json) {
    mmr = json['mmr'];
    rank = json['rank'];
    rankSize = json['rankSize'];
    totalGames = json['totalGames'];
    totalWins = json['totalWins'];
    totalTeamKills = json['totalTeamKills'];
    totalDeaths = json['totalDeaths'];
    escapeCount = json['escapeCount'];
    rankPercent = json['rankPercent'];
    averageRank = json['averageRank'];
    averageKills = json['averageKills'];
    averageAssistants = json['averageAssistants'];
    averageHunts = json['averageHunts'];
    top1 = json['top1'];
    top2 = json['top2'];
    top3 = json['top3'];
    top5 = json['top5'];
    top7 = json['top7'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['mmr'] = mmr;
    data['rank'] = rank;
    data['rankSize'] = rankSize;
    data['totalGames'] = totalGames;
    data['totalWins'] = totalWins;
    data['totalTeamKills'] = totalTeamKills;
    data['totalDeaths'] = totalDeaths;
    data['escapeCount'] = escapeCount;
    data['rankPercent'] = rankPercent;
    data['averageRank'] = averageRank;
    data['averageKills'] = averageKills;
    data['averageAssistants'] = averageAssistants;
    data['averageHunts'] = averageHunts;
    data['top1'] = top1;
    data['top2'] = top2;
    data['top3'] = top3;
    data['top5'] = top5;
    data['top7'] = top7;
    data['_id'] = sId;
    return data;
  }
}
