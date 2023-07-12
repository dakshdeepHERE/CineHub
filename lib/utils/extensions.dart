extension AppExtensions on String {
  String splitDate() {
    return split(' ')[0].toString();
  }

  String splitDateToYear() {
    return split('-')[0].toString();
  }

  String splitDateToMonth() {
    return split('-')[1].toString();
  }

  String splitDateToDay() {
    return split('-')[2].toString();
  }

  String devideMinuteToHour(String minute) {
    String houre = (int.parse(minute) / 60).toStringAsFixed(2);
    return houre;
  }

  String devideHoureAndMinute(String value, String timeInMinute) {
    String houre = value.split('.')[0];
    String minute =
        (int.parse(timeInMinute) - int.parse(houre) * 60).toString();
    String finalDevided = '${houre}h ${minute}m';
    return finalDevided;
  }

  List<String> devideActorsIntoList(String allListInString) {
    final split = allListInString.split(',');
    final Map<int, String> actor = {
      for (int i = 0; i < split.length; i++) i: split[i]
    };
    List<String> actorList = [];
    actor.forEach((key, value) {
      actorList.add(value);
    });
    return actorList;
  }

  List<String> devideWritersIntoList(String allListInString) {
    final split = allListInString.split(', ');
    final Map<int, String> writer = {
      for (int i = 0; i < split.length; i++) i: split[i]
    };
    List<String> writerList = [];
    writer.forEach((key, value) {
      writerList.add(value);
    });
    print('writer list is ${writerList.length}');
    return writerList;
  }
}
