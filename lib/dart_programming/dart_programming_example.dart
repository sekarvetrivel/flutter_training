import 'dart:io';

void main() {
  var number = 42;

  variableExample();
  sampleComment();
  dataTypeExample();
  arithmeticExample();
  equalityExample();
  comparisonExample();
  logicalExample();
  stringsExample();
  escapingStringsExample();
  immutabilityExample();
  nullabilityExample();
  nullAwareExample();
  conditionalsExample();
  whileLoopExample();
  collectionsExample();
  functionsExample();

  printInteger(number); // This is also a single-line comment.
  notNullAssertion();
  forLoopExample();
  classExample();
  enumExample();
  asyncAndAwaitExample();
  exceptionExample();
}

var year = 1977;
var flybyObjects = ['Jupiter', 'Saturn', 'Uranus', 'Neptune'];

void variableExample() {
  var myAge = 27;
  print("My Age is $myAge\n");

  var name = 'Voyager I';
  var antennaDiameter = 3.7;
  var image = {
    'tags': ['saturn'],
    'url': '//path/to/saturn.jpg'
  };
}

void dataTypeExample() {
  var myAge = 27;
  print("My Age is $myAge\n");

  var pi = 3.14;
  print("Value of pi is $pi\n");

  dynamic numberOfKittens;

  numberOfKittens = 'There are no kittens!';
  print('Dynamic as String - $numberOfKittens');

  numberOfKittens = 0;
  print('Dynamic as Integer - $numberOfKittens');

  numberOfKittens = 0.5;
  print('Dynamic as Double - $numberOfKittens\n');

  bool areThereKittens = false;
  print("Boolean Exammple - $areThereKittens");
  numberOfKittens = 1;
  areThereKittens = true;
  print("Boolean Exammple - $areThereKittens\n");
}

void arithmeticExample() {
  print("Arithmetic Example");

  print(40 + 2); // 42

  print(44 - 2); // 42

  print(21 * 2); // 42

  print("${84 / 2}\n"); // 42.0
}

void equalityExample() {
  print("Equality Example");

  print(42 == 43); // false

  print("${42 != 43} \n"); // true
}

void comparisonExample() {
  print("Comparison Example");
  print(42 < 43);

  var value = 42.0;

  value += 1;
  print(value); // 43.0

  value -= 1;
  print(value); // 42.0

  value *= 2;
  print(value); // 84.0

  value /= 2;
  print(value);

  value++;
  print(value);

  print("${392 % 50}\n");
}

void logicalExample() {
  print("Logical Example");
  print((41 < 42) && (42 < 43)); // true

  print((41 < 42) || (42 > 43)); // true

  print(!(41 < 42));
}

void escapingStringsExample() {
  print("\nEscaping Strings Example");
  var quote =
      'If you can\'t explain it simply\nyou don\'t understand it well enough.';
  print(quote);
  var rawString =
      r"If you can't explain it simply\nyou don't understand it well enough.";
  print(rawString);
}

void immutabilityExample() {
  print("\nImmutability Example");
  const speedOfLight = 299792458;
  print(speedOfLight);

  final planet = 'Jupiter';
  final String moon = 'Europa';
  print('$planet has a moon, $moon');
}

void nullabilityExample() {
  print("\nNullability Example");
  String? middleName1 = null;
  print(middleName1); // null

  String? middleName2;
  print(middleName2); // null
}

void nullAwareExample() {
  print("\nNull-Aware Example");
  String? middleName = null;
  print(middleName); // null

  var name = middleName ?? 'none';
  print(name);

  print(middleName?.length); // null
}

void conditionalsExample() {
  print("\nConditionals Example");
  var animal = 'fox';

  if (animal == 'cat' || animal == 'dog') {
    print('Animal is a house pet.');
  } else {
    print('Animal is NOT a house pet.');
  }

  if (animal == 'cat' || animal == 'dog') {
    print('Animal is a house pet.');
  } else if (animal == 'rhino') {
    print('That\'s a big animal.');
  } else {
    print('Animal is NOT a house pet.');
  }

  if (year >= 2001) {
    print('21st century');
  } else if (year >= 1901) {
    print('20th century');
  }

  for (final object in flybyObjects) {
    print(object);
  }

  for (int month = 1; month <= 12; month++) {
    print(month);
  }

  while (year < 2016) {
    year += 1;
  }
}

void whileLoopExample() {
  print("\nWhileLoop Example");
  var i = 1;
  while (i < 10) {
    print(i);
    i++;
  }

  print("\nDoWhileLoop Example");
  i = 1;
  do {
    print(i);
    i++;
  } while (i < 10);

  print("\nDoWhileLoop Continue & Break Example");
/*  i = 1;
  do {
    print(i);
    if (i == 5) {
      continue; //it makes Infinite Loop
    }
    ++i;
  } while (i < 10);*/

  i = 1;
  do {
    print(i);
    if (i == 5) {
      break;
    }
    ++i;
  } while (i < 10);
}

void collectionsExample() {
  print("\nCollections Example");
  List desserts = ['cookies', 'cupcakes', 'donuts', 'pie'];
  final numbers = [42, -1, 299792458, 100];

  final firstDessert = desserts[0];
  print(firstDessert); // cookies

  print(desserts);
  desserts.add('cake');
  print("cake added to Desserts - $desserts");
// [cookies, cupcakes, donuts, pie, cake]

  print(desserts);
  desserts.remove('donuts');
  print("donuts Removed from Desserts - $desserts");
// [cookies, cupcakes, pie, cake]

  for (final dessert in desserts) {
    print('I love to eat $dessert.');
  }

  Map<String, int> calories = {
    'cake': 500,
    'donuts': 150,
    'cookies': 100,
  };
  final donutCalories = calories['donuts'];
  print("donuts calories - $donutCalories");

  calories['brownieFudgeSundae'] = 1346;
  print(calories);
}

void functionsExample() {
  print("\nFunctions Example");

  bool isBanana(String fruit) {
    return fruit == 'banana';
  }

  int fibonacci(int n) {
    if (n == 0 || n == 1) return n;
    return fibonacci(n - 1) + fibonacci(n - 2);
  }

  String fullName(String first, String last, [String? title]) {
    if (title == null) {
      return '$first $last';
    } else {
      return '$title $first $last';
    }
  }

  bool withinTolerance({required int value, int min = 0, int max = 10}) {
    return min <= value && value <= max;
  }

  final onPressed = () {
    print('button pressed');
  };

  // refactored - much nicer to read
  final onPressedAnonymous = () => print('button pressed');

  final drinks = ['water', 'juice', 'milk'];
  final bigDrinks = drinks.map((drink) => drink.toUpperCase());

  var fruit = 'apple';
  print(isBanana(fruit));

  print(fullName('Joe', 'Howard'));
// Joe Howard

  print(fullName('Albert', 'Einstein', 'Professor'));
// Professor Albert Einstein

  print(withinTolerance(min: 1, max: 5, value: 11));

  print(withinTolerance(value: 5));

  onPressed();
  onPressedAnonymous();

  print(bigDrinks); // (WATER, JUICE, MILK)

  var value = 20;
  var result = fibonacci(value);
  print("Fibonacci value of $value is $result");

  var filter = flybyObjects.where((name) => name.contains('turn'));
  filter.forEach(print);
  print(filter.toList());
}

void stringsExample() {
  var firstName = 'Albert';
  String lastName = "Einstein";
  var physicist = "\n$firstName $lastName likes the number ${84 / 2}";
  print(physicist);
}

void sampleComment() {
// This is a single-line comment.

/*
 This is a multi-line comment block. This is useful for long
 comments that span several lines.
 */
}

void printInteger(int aNumber) {
  print('\nThe number is $aNumber.\n');
}

void notNullAssertion() {
  int? lineCount;
  assert(lineCount == null);
}

void classExample() {
  print("\nClass Example");
  var voyager = Spacecraft('Voyager I', DateTime(1977, 9, 5));
  //voyager.launchYear = 12;
  voyager.describe();

  var voyager3 = Spacecraft.unlaunched('Voyager III');
  voyager3.describe();
}

enum PlanetType { terrestrial, gas, ice }

void enumExample() {
  print("\nEnum Example");
  final yourPlanet = Planet.mercury;

  if (!yourPlanet.isGiant) {
    print('Your planet is not a "giant planet".');
  }
}

void asyncAndAwaitExample() {
  const oneSecond = Duration(seconds: 2);

  Future<void> printWithDelay(String message) async {
    await Future.delayed(oneSecond);
    print(message);
  }

  Future<void> printWithDelay2(String message) {
    return Future.delayed(oneSecond).then((_) {
      print(message);
    });
  }

  Future<void> createDescriptions(Iterable<String> objects) async {
    for (final object in objects) {
      try {
        var file = File('$object.txt');
        if (await file.exists()) {
          var modified = await file.lastModified();
          print(
              'File for $object already exists. It was modified on $modified.');
          continue;
        }
        await file.create();
        await file.writeAsString('Start describing $object in this file.');
      } on IOException catch (e) {
        print('Cannot create description for $object: $e');
      }
    }
  }

  Stream<String> report(Spacecraft craft, Iterable<String> objects) async* {
    for (final object in objects) {
      await Future.delayed(oneSecond);
      yield '${craft.name} flies by $object';
    }
  }

  printWithDelay("printWithDelay using async,await");
  printWithDelay2("printWithDelay using then of delay");
  Iterable<String> objects = ["sekar", "boomi", "rooba"];
  createDescriptions(objects);
  report(Spacecraft("sekar", DateTime(1995, 9, 12)), objects);
}

Future<void> exceptionExample() async {
  var astronauts = 10;
  if (astronauts == 0) {
    throw StateError('No astronauts.');
  }

  try {
    for (final object in flybyObjects) {
      var description = await File('$object.txt').readAsString();
      print(description);
    }
  } on IOException catch (e) {
    print('Could not describe object: $e');
  } finally {
    flybyObjects.clear();
  }
}

/// Enum that enumerates the different planets in our solar system
/// and some of their properties.
enum Planet {
  mercury(planetType: PlanetType.terrestrial, moons: 0, hasRings: false),
  venus(planetType: PlanetType.terrestrial, moons: 0, hasRings: false),
  // ···
  uranus(planetType: PlanetType.ice, moons: 27, hasRings: true),
  neptune(planetType: PlanetType.ice, moons: 14, hasRings: true);

  /// A constant generating constructor
  const Planet(
      {required this.planetType, required this.moons, required this.hasRings});

  /// All instance variables are final
  final PlanetType planetType;
  final int moons;
  final bool hasRings;

  /// Enhanced enums support getters and other methods
  bool get isGiant =>
      planetType == PlanetType.gas || planetType == PlanetType.ice;
}

void forLoopExample() {
  for (int i = 0; i < 5; i++) {
    print('hello ${i + 1}');
  }

  var sum = 0;

  for (var i = 1; i <= 10; i++) {
    sum += i;
  }
  print("The sum is $sum");
}

class Spacecraft {
  String name;
  DateTime? launchDate;

  // Read-only non-final property
  int? get launchYear => launchDate?.year;

  // Constructor, with syntactic sugar for assignment to members.
  Spacecraft(this.name, this.launchDate) {
    // Initialization code goes here.
  }

  // Named constructor that forwards to the default one.
  Spacecraft.unlaunched(String name) : this(name, null);

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

mixin Piloted {
  int astronauts = 1;

  void describeCrew() {
    print('Number of astronauts: $astronauts');
  }
}

class PilotedCraft with Piloted {
  @override
  void describeCrew() {
    // TODO: implement describeCrew
    super.describeCrew();
  }
}

class MockSpaceship implements Spacecraft {
  @override
  DateTime? launchDate;

  @override
  late String name;

  @override
  void describe() {
    // TODO: implement describe
  }

  @override
  // TODO: implement launchYear
  int? get launchYear => throw UnimplementedError();
}

abstract class Describable {
  void describe();

  void describeWithEmphasis() {
    print('=========');
    describe();
    print('=========');
  }
}

class sampleClass implements Describable {
  @override
  void describe() {
    // TODO: implement describe
  }

  @override
  void describeWithEmphasis() {
    // TODO: implement describeWithEmphasis
  }
}
