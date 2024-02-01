import 'package:dio/src/response.dart';

class GameInfoModel {
  int? iId;
  List<UserGames>? userGames;

  GameInfoModel({this.iId, this.userGames});

  GameInfoModel.fromJson(Map<String, dynamic> json) {
    iId = json['_id'];
    if (json['userGames'] != null) {
      userGames = <UserGames>[];
      json['userGames'].forEach((v) {
        userGames!.add(UserGames.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson(Response response) {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = iId;
    if (userGames != null) {
      data['userGames'] = userGames!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class UserGames {
  int? userNum;
  int? playTime;
  int? characterNum;
  int? characterLevel;
  int? teamKill;
  int? damageToPlayer;
  List<int>? finalInfusion;
  Equipment? equipment;
  int? sumTotalVFCredits;
  String? sId;

  UserGames(
      {this.userNum,
      this.playTime,
      this.characterNum,
      this.characterLevel,
      this.teamKill,
      this.damageToPlayer,
      this.finalInfusion,
      this.equipment,
      this.sumTotalVFCredits,
      this.sId});

  UserGames.fromJson(Map<String, dynamic> json) {
    userNum = json['userNum'];
    playTime = json['playTime'];
    characterNum = json['characterNum'];
    characterLevel = json['characterLevel'];
    teamKill = json['teamKill'];
    damageToPlayer = json['damageToPlayer'];
    finalInfusion = json['finalInfusion'].cast<int>();
    equipment = json['equipment'] != null
        ? Equipment.fromJson(json['equipment'])
        : null;
    sumTotalVFCredits = json['sumTotalVFCredits'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userNum'] = userNum;
    data['playTime'] = playTime;
    data['characterNum'] = characterNum;
    data['characterLevel'] = characterLevel;
    data['teamKill'] = teamKill;
    data['damageToPlayer'] = damageToPlayer;
    data['finalInfusion'] = finalInfusion;
    if (equipment != null) {
      data['equipment'] = equipment!.toJson();
    }
    data['sumTotalVFCredits'] = sumTotalVFCredits;
    data['_id'] = sId;
    return data;
  }
}

class Equipment {
  String? s0;
  String? s1;
  String? s2;
  String? s3;
  String? s4;

  Equipment({this.s0, this.s1, this.s2, this.s3, this.s4});

  Equipment.fromJson(Map<String, dynamic> json) {
    s0 = json['0'];
    s1 = json['1'];
    s2 = json['2'];
    s3 = json['3'];
    s4 = json['4'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['0'] = s0;
    data['1'] = s1;
    data['2'] = s2;
    data['3'] = s3;
    data['4'] = s4;
    return data;
  }
}
