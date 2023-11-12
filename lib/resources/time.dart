class Time {
  final int hours;
  final int minutes;

  Time({
    this.hours = 0,
    this.minutes = 0,
  }) : assert(minutes < 60 && minutes >= 0 && hours >= 0 && hours < 24);
}
