class DateUtilities {
  String? hoursBetween(DateTime dateOne, DateTime dateTwo) {
    return ('${dateTwo.difference(dateOne).inHours}h');
  }
}
