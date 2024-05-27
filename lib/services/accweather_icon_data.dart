class AccIconData {
  AccIconData({this.iconNumber1, this.iconNumber2, this.iconNumber3});
  int? iconNumber1;
  int? iconNumber2;
  int? iconNumber3;
  AccIconData.fromJson(Map<String, dynamic> json) {
    iconNumber1 = json['DailyForecasts'][1]['Day']['Icon'];
    iconNumber2 = json['DailyForecasts'][2]['Day']['Icon'];
    iconNumber3 = json['DailyForecasts'][3]['Day']['Icon'];
  }
}
