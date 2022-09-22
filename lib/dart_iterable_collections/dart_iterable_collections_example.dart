User sekar = User("sekar", 21);
User boomi = User("boomi", 15);
User rooba = User("rooba", 13);

EmailAddress sekarEmail = EmailAddress("sekar@sekar.com");
EmailAddress boomiEmail = EmailAddress("boomi@boomi");
EmailAddress roobaEmail = EmailAddress("rooba@rooba.com");

void main() {
  printIterable();
  printIterableUsingIterator();
  printIterableFirstAndLast();
  printIterableParticular();
  foundItemsUsingFirstWhere();
  foundItemsUsingSingleWhere();
  checkItemsUsingEvery();
  checkItemsUsingContainsAndEvery();
  checkUserAgeValidation();
  isTypeOfFunctions();
  whileTypeOfFunctions();
  filterUserUsingWhere();
  mapItemsFunctions();
  getUserAndAgeUsingMap();
  getEmailAddressAndFilters();
  hashSetExample();
  usingSingleOption();
}

void printIterable() {
  const iterable = ['Salad', 'Popcorn', 'Toast'];
  for (final element in iterable) {
    if(iterable.last != element)
      print(element);
    else
      print(element+"\n");
  }
}

void printIterableUsingIterator() {
  const iterable = ['Salad', 'Popcorn', 'Toast'];
  var iterator = iterable.iterator;
  while (iterator.moveNext()) {
    print(iterator.current);
  }
}

void printIterableFirstAndLast() {
  Iterable<String> iterable = const ['Salad', 'Popcorn', 'Toast'];
  print('\nThe first element is ${iterable.first}');
  print('The last element is ${iterable.last}');
}

void printIterableParticular() {
  Iterable<String> iterable = const ['Salad', 'Popcorn', 'Toast'];
  var index = 1;
  print('\n$index element is ${iterable.elementAt(index)}');
}

bool predicate(String item) {
  return item.length > 5;
}

void foundItemsUsingFirstWhere() {
  const items = ['Salad', 'Popcorn', 'Toast', 'Lasagne'];

  // You can find with a simple expression:
  var foundItem1 = items.firstWhere((item) => item.length > 5);
  print("\n" + foundItem1);

  // Or try using a function block:
  var foundItem2 = items.firstWhere((item) {
    return item.length > 5;
  });
  print(foundItem2);

  // Or even pass in a function reference:
  var foundItem3 = items.firstWhere(predicate);
  print(foundItem3);

  // You can also use an `orElse` function in case no value is found!
  var foundItem4 = items.firstWhere(
    (item) => item.length > 10,
    orElse: () => 'None!',
  );
  print(foundItem4);
}

void foundItemsUsingSingleWhere() {
  const list = ['Salad', 'Popcorn', 'Toast'];
  print("\n" + singleWhere(list));
}

String singleWhere(Iterable<String> items) {
  return items.singleWhere((item) => item.length > 5);
}

void checkItemsUsingEvery() {
  const iterable = ['Salad', 'Popcorn', 'Toast'];
  var length = 5;
  print(
      "\nIs contains items length greater than given length - ${iterable.every((item) => item.length >= length)}\n");
}

void checkItemsUsingContainsAndEvery() {
  const items = ['Salad', 'Popcorn', 'Toast'];
  var length = 5;
  var character = "a";

  if (items.every((item) => item.length >= length)) {
    print('All items have length >= $length');
  }

  if (items.any((item) => item.contains(character))) {
    print('At least one item contains "$character"');
  } else {
    print('No item contains "$character"');
  }
}

bool anyUserUnder18(Iterable<User> users) {
  return users.any((user) => user.age < 18);
}

bool everyUserOver13(Iterable<User> users) {
  return users.every((user) => user.age > 13);
}

class User {
  String name;
  int age;

  User(
    this.name,
    this.age,
  );
}

var users = [sekar, boomi, rooba];
var emails = [sekarEmail, boomiEmail, roobaEmail];

void checkUserAgeValidation() {
  print("\nCheck Any user under 18 - " + anyUserUnder18(users).toString());
  print(
      "Check Every user over 13 - " + everyUserOver13(users).toString() + "\n");
}

void isTypeOfFunctions() {
  var evenNumbers = const [1, -2, 3, 42].where((number) => number.isEven);

  for (final number in evenNumbers) {
    print('$number is even.');
  }

  if (evenNumbers.any((number) => number.isNegative)) {
    print('evenNumbers contains negative numbers.');
  }

  // If no element satisfies the predicate, the output is empty.
  var largeNumbers = evenNumbers.where((number) => number > 1000);
  if (largeNumbers.isEmpty) {
    print('largeNumbers is empty!');
  }
}

void whileTypeOfFunctions() {
  const numbers = [1, 3, -2, 0, 4, 5];

  var numbersUntilZero = numbers.takeWhile((number) => number != 0);
  print('\nNumbers until 0: $numbersUntilZero');

  var numbersStartingAtZero = numbers.skipWhile((number) => number != 0);
  print('Numbers starting at 0: $numbersStartingAtZero');
}

Iterable<User> filterOutUnder21(Iterable<User> users) {
  return users.where((element) => element.age >= 21);
}

Iterable<User> findShortNamed(Iterable<User> users) {
  return users.where((element) => element.name.length <= 3);
}

void filterUserUsingWhere() {
  print("\nFilter Out User Under 21 - " + anyUserUnder18(users).toString());
  print("Find Short Named User - " + everyUserOver13(users).toString() + "\n");
}

void mapItemsFunctions() {
  var numbersByTwo = const [1, -2, 3, 42].map((number) => number * 2);
  print('Numbers: $numbersByTwo');
}

Iterable<String> getNameAndAges(Iterable<User> users) {
  return users.map((element) => "${element.name} is ${element.age}");
}

void getUserAndAgeUsingMap() {
  print(getNameAndAges(users));
}

Iterable<EmailAddress> parseEmailAddresses(Iterable<EmailAddress> emails) {
  return emails.map((e) => EmailAddress(e.address));
}

bool anyInvalidEmailAddress(Iterable<EmailAddress> emails) {
  return emails.any((e) => !isEmail(e.address));
}

Iterable<EmailAddress> validEmailAddresses(Iterable<EmailAddress> emails) {
  return emails.where((element) => isEmail(element.address));
}

class EmailAddress {
  final String address;

  EmailAddress(this.address);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EmailAddress && address == other.address;

  @override
  int get hashCode => address.hashCode;

  @override
  String toString() {
    return 'EmailAddress{address: $address}';
  }
}

bool isEmail(String em) {
  String p =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  RegExp regExp = new RegExp(p);

  return regExp.hasMatch(em);
}

void getEmailAddressAndFilters() {
  print("\n" + parseEmailAddresses(emails).toString());
  print("any InvalidEmail Address - " +
      anyInvalidEmailAddress(emails).toString());
  print(
      "validEmail Address - " + validEmailAddresses(emails).toString() + "\n");
}

void hashSetExample() {
  var kidsBooks = {
    'Matilda': 'Roald Dahl',
    'Green Eggs and Ham': 'Dr Seuss',
    'Where the Wild Things Are': 'Maurice Sendak'
  };
  for (var book in kidsBooks.keys) {
    print('$book was written by ${kidsBooks[book]}');
  }
}

void usingSingleOption() {
  final List<String> listOfCar = ["Audi"];
  print("\n"+listOfCar.single);
}
