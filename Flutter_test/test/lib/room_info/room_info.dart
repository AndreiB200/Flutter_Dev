class RoomInfo {
  int temperatureInside;
  int humidity;
  int temperatureOutside;

  String asset;

  RoomInfo(
      {this.temperatureInside = 0,
      this.humidity = 0,
      this.temperatureOutside = 0,
      this.asset = ''});
}
