import 'package:flutter_core/data_model_puppet.dart';
import 'package:flutter_core/list_store.dart';
import 'package:flutter_test/flutter_test.dart';

/// Tests for the [ListStore] class.
void main() {
  late ListStore<DataModelPuppet> _testStore;

  /// Initialises a clean [ListStore] for each test.
  setUp(() {
    _testStore = ListStore();
  });

  test("Test 1 - A valid entry can be added to a store", (){
    DataModelPuppet one = DataModelPuppet.create();
    expect(_testStore.add(one), isTrue);
  });

  test("Test 2 - contains(entry) should successfully find a contained element",
          () {
    DataModelPuppet one = DataModelPuppet.create();
    _testStore.add(one);
    expect(_testStore.contains(one), isTrue);
  });
}
