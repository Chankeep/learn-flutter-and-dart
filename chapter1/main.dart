class Spacecraft {
  String name;
  DateTime? launchDate;

  // Read-only non-final property
  int? get launchYear => launchDate?.year;

  set launchYear(int? newYear) {
    if (newYear == null) {
      launchDate = null;
    } else {
      launchDate = DateTime(newYear, 1, 1);
    }
  }

  // Constructor, with syntactic sugar for assignment to members.
  Spacecraft(this.name, this.launchDate) {
    // Initialization code goes here.
  }

  // Named constructor that forwards to the default one.
  Spacecraft.unlaunched(String name) : this(name, null);

  Spacecraft.unknow() : this("unknow", null);

  // Method.
  void describe() {
    print('Spacecraft: $name');
    // Type promotion doesn't work on getters.
    var launchDate = this.launchDate;
    if (launchDate != null) {
      int years = DateTime.now().difference(launchDate).inDays ~/ 365;
      print('Launched: $launchYear ($years years ago)');
    } else {
      print('Unlaunched');
    }
  }
}

void main() {
  var voyager = Spacecraft("chankeep", DateTime(1977, 9, 5));
  voyager.describe(); // Spacecraft: voyager Launched: 1977 (49 years ago)

  var voyager3 = Spacecraft.unlaunched('voyager 3');
  voyager3.describe(); // Spacecraft: voyager 3 Unlaunched
}
