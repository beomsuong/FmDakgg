class GameInfoModel {
  final int id;
  final List<UserGameModel> userGames;

  GameInfoModel({required this.id, required this.userGames});

  factory GameInfoModel.fromJson(Map<String, dynamic> json) {
    return GameInfoModel(
      id: json['_id'],
      userGames: List<UserGameModel>.from(
          json['userGames'].map((x) => UserGameModel.fromJson(x))),
    );
  }
}

class UserGameModel {
  final int gameRank;
  final int userNum;
  final int playTime;
  final int characterNum;
  final int characterLevel;
  final int teamKill;
  final int damageToPlayer;
  final List<dynamic> finalInfusion;
  final Map equipment;
  final int sumTotalVFCredits;

  UserGameModel({
    required this.gameRank,
    required this.userNum,
    required this.playTime,
    required this.characterNum,
    required this.characterLevel,
    required this.teamKill,
    required this.damageToPlayer,
    required this.finalInfusion,
    required this.equipment,
    required this.sumTotalVFCredits,
  });

  factory UserGameModel.fromJson(Map<String, dynamic> json) {
    return UserGameModel(
      gameRank: json['gameRank'],
      userNum: json['userNum'],
      playTime: json['playTime'],
      characterNum: json['characterNum'],
      characterLevel: json['characterLevel'],
      teamKill: json['teamKill'],
      damageToPlayer: json['damageToPlayer'],
      finalInfusion: List<dynamic>.from(json['finalInfusion']),
      equipment: json['equipment'] as Map,
      sumTotalVFCredits: json['sumTotalVFCredits'],
    );
  }
}
