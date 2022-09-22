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

  printInteger(number); // This is also a single-line comment.
  notNullAssertion();
  forLoopExample();
}

void variableExample() {
  var myAge = 27;
  print("My Age is $myAge\n");
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

void forLoopExample() {
  for (int i = 0; i < 5; i++) {
    print('hello ${i + 1}');
  }
}
