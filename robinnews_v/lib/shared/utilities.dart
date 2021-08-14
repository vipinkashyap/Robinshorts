class Utilities {
  String? hoursBetween(DateTime dateOne, DateTime dateTwo) {
    return (dateTwo.difference(dateOne).inHours.toString() + 'h');
  }
}
