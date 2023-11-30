class WeekWiseWorkedHours {
  String? mON;
  String? tUE;
  String? wED;
  String? tHU;
  String? fRI;
  String? sAT;
  String? sUN;

  WeekWiseWorkedHours(
      {this.mON, this.tUE, this.wED, this.tHU, this.fRI, this.sAT, this.sUN});

  WeekWiseWorkedHours.fromJson(Map<String, dynamic> json) {
    mON = json['MON'];
    tUE = json['TUE'];
    wED = json['WED'];
    tHU = json['THU'];
    fRI = json['FRI'];
    sAT = json['SAT'];
    sUN = json['SUN'];
  }

  WeekWiseWorkedHours toJson() => WeekWiseWorkedHours(
        mON: mON,
        tUE: tUE,
        wED: wED,
        tHU: tHU,
        fRI: fRI,
        sAT: sAT,
        sUN: sUN,
      );
}
