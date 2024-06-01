class AccIconData {
  AccIconData({this.iconNumber1, this.iconNumber2, this.iconNumber3});
  int? iconNumber1, iconNumber2, iconNumber3, iconNumber4;
  AccIconData.fromJson(Map<String, dynamic> json) {
    iconNumber1 = json['DailyForecasts'][1]['Day']['Icon'];
    iconNumber2 = json['DailyForecasts'][2]['Day']['Icon'];
    iconNumber3 = json['DailyForecasts'][3]['Day']['Icon'];
    iconNumber4 = json['DailyForecasts'][4]['Day']['Icon'];
  }
}
