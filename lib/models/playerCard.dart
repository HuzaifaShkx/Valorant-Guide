class PlayerCard {
  String? uuid;
  String? displayName;
  bool? isHiddenIfNotOwned;
  String? themeUuid;
  String? displayIcon;
  String? smallArt;
  String? wideArt;
  String? largeArt;
  String? assetPath;

  PlayerCard(
      {this.uuid,
      this.displayName,
      this.isHiddenIfNotOwned,
      this.themeUuid,
      this.displayIcon,
      this.smallArt,
      this.wideArt,
      this.largeArt,
      this.assetPath});

  PlayerCard.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    displayName = json['displayName'];
    isHiddenIfNotOwned = json['isHiddenIfNotOwned'];
    themeUuid = json['themeUuid'];
    displayIcon = json['displayIcon'];
    smallArt = json['smallArt'];
    wideArt = json['wideArt'];
    largeArt = json['largeArt'];
    assetPath = json['assetPath'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uuid'] = this.uuid;
    data['displayName'] = this.displayName;
    data['isHiddenIfNotOwned'] = this.isHiddenIfNotOwned;
    data['themeUuid'] = this.themeUuid;
    data['displayIcon'] = this.displayIcon;
    data['smallArt'] = this.smallArt;
    data['wideArt'] = this.wideArt;
    data['largeArt'] = this.largeArt;
    data['assetPath'] = this.assetPath;
    return data;
  }
}
