extension LastDayOfAMonth on DateTime {
  /// The last day of a given month
  int get lastDayOfMonth {
    late DateTime lastDayOfMonth;
    DateTime now = this;
    if (now.month % 12 == 0) {
      lastDayOfMonth = DateTime(now.year + 1, now.month, 0);
    } else {
      lastDayOfMonth = DateTime(now.year, now.month + 1, 0);
    }
    return lastDayOfMonth.day;
  }
}

extension StringExtension on String {
  String capitalizeFirstLetter() {
    return "${this[0].toUpperCase()}${this.substring(1).toLowerCase()}";
  }
}

extension SubsetOfList<E> on List<E> {
  bool isSubsetOf(List<E> anotherList) {
    bool _isSubset = false;
    this.forEach((element) {
      if (this.contains(element)) {
        _isSubset = true;
      }
    });

    return _isSubset;
  }
}
