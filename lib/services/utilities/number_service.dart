extension Range on num {
  List<num> until(num endPoint) {
    var exclusive = to(endPoint);
    exclusive.removeLast();
    return exclusive;
  }

  List<num> to(num endPoint) {
    var numbers = <num>[];
    if (endPoint > this) {
      for (int i = this; i <= endPoint; i++) {
        numbers.add(i);
      }
    } else {
      for (int i = this; i >= endPoint; i--) {
        numbers.add(i);
      }
    }
    return numbers;
  }
}