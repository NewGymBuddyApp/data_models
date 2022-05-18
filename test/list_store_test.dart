import 'package:flutter_core/data_model_puppet.dart';
import 'package:flutter_core/list_store.dart';
import 'package:flutter_test/flutter_test.dart';

/// Tests for the [ListStore] class.
void main() {
  /// The instance of the ListStore being used.
  late ListStore<DataModelPuppet> _testStore;
  /// An instance of [DataModelPuppet] used as a child of the [ListStore].
  DataModelPuppet one = DataModelPuppet.create();
  DataModelPuppet two = DataModelPuppet.create();

  /// Initialises a clean [ListStore] for each test.
  setUp(() {
    _testStore = ListStore();
  });

  test("Test 1 - A valid entry can be added to a store", (){
    expect(_testStore.add(one), isTrue);
  });

  test("Test 2 - contains(entry) should successfully find a contained element",
          () {
    _testStore.add(one);
    expect(_testStore.contains(one), isTrue);
  });

  test("Test 3 - size() returns the correct size of the ListStore", () {
    _testStore.add(one);
    expect(_testStore.size(), 1);
  });

  test("Test 4 - remove(entry) removes entry from the ListStore", () {
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
}
