import 'package:data_models/data_model_puppet.dart';
import 'package:data_models/list_store.dart';
import 'package:flutter_test/flutter_test.dart';

/// Tests for the [ListStore] class.
void main() {
  /// The instance of the ListStore being used.
  late ListStore<DataModelPuppet> _testStore;
  /// An instance of [DataModelPuppet] used as a child of the [ListStore].
  DataModelPuppet one = DataModelPuppet.create("a");
  DataModelPuppet two = DataModelPuppet.create("b");
  DataModelPuppet three = DataModelPuppet.create("c");

  /// Initialises a clean [ListStore] for each test.
  setUp(() {
    _testStore = ListStore();
  });

  test("Test 1 - A valid element can be added to a store", (){
    expect(_testStore.add(one), isTrue);
  });

  test("Test 2 - contains(element) should successfully find a contained element",
          () {
    _testStore.add(one);
    expect(_testStore.contains(one), isTrue);
  });

  test("Test 3 - size() returns the correct size of the ListStore", () {
    _testStore.add(one);
    expect(_testStore.size(), 1);
  });

  test("Test 4 - remove(element) removes element from the ListStore", () {
    _testStore.add(one);
    expect(_testStore.size(), 1);
    expect(_testStore.remove(one), isTrue);
    expect(_testStore.size(), 0);
  });

  test("Test 5 - empty() wipes the list of all values", () {
    _testStore.add(one);
    _testStore.add(two);
    expect(_testStore.size(), 2);
    _testStore.empty();
    expect(_testStore.size(), 0);
  });

  test("Test 6 - A duplicate element cannot be added", (){
    expect(_testStore.add(one), isTrue);
    expect(_testStore.add(one), isFalse);
  });

  test("Test 7 - An element can be found and returned", () {
    _testStore.add(one);
    expect(_testStore.get(one.uid), one);
  });

  test("Test 8 - Can return a valid List from ListStore", () {
    _testStore.add(one);
    _testStore.add(two);
    expect(_testStore.getList().length, 2);
  });

  test("Test 9 - getAllUID returns all the UID's of the elements in "
      "ListStore",(){
    _testStore.add(one);
    _testStore.add(two);
    List<String> matcher = [one.uid, two.uid];
    expect(_testStore.getAllUID(), matcher);
  });
  
  test("Test 10 - Elements can be sorted", (){
    _testStore.add(two);
    _testStore.add(three);
    _testStore.add(one);
    List<DataModelPuppet> matcher = [one, two, three];
    _testStore.sort("name", true);
    expect(_testStore.getList(), matcher);
  });

  test("Test 11 - Lists can be sorted in descending order", (){
    _testStore.add(two);
    _testStore.add(three);
    _testStore.add(one);
    List<DataModelPuppet> matcher = [three, two, one];
    _testStore.sort("name", false);
    expect(_testStore.getList(), matcher);
  });

  test("Test 12 - toJson correctly returns a formatted Map", (){
    _testStore.add(one);
    _testStore.add(two);
    Map actual = _testStore.toJson();
    Map matcher = {
      "elements" : [one.toJson(), two.toJson()]
    };
    expect(actual, matcher);
  });

  test("Test 13 - forEach allows easy iteration over ListStore", (){
    _testStore.add(one);
    _testStore.add(two);
    String actual = "";
    _testStore.forEach((element) {
      actual += element.name;
    });
    String matcher = "ab";
    expect(actual, matcher);
  });
}
