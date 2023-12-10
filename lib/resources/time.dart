class Time {
  late int hours;
  late int minutes;

  Time({
    this.hours = 0,
    this.minutes = 0,
  }) : assert(minutes < 60 && minutes >= 0 && hours >= 0 && hours < 24);

  Time.now() {
    hours = DateTime.now().hour;
    minutes = DateTime.now().minute;
  }

  DateTime get toDateTime => DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day,
        hours,
        minutes,
      );
}
