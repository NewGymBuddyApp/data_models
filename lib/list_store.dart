import 'package:flutter_core/data_model.dart';

/// Model representation of a highly-customisable list which acts as a Set.
/// Custom implementation allows many other operations to be hidden behind
/// this object that would usually require the combination of many objects.
class ListStore<T extends DataModel> {
  /// The Set holding the instances of [DataModel].
  late Set<T> _store;

  /// Constructor for the [ListStore]. Initialises the privatised [Set].
  ListStore() {
    _store = Set();
  }

  /// Adds a new entry to the [ListStore]. Returns [true] if the value was
  /// successfully added and was not already in the set
  bool add(T entry) {
    return _store.add(entry);
  }

  /// Checks the [ListStore] for membership of the provided [entry]. Returns
  /// [true] if [T] is a member.
  bool contains(T entry) {
    return _store.contains(entry);
  }

  /// Returns the number of elements stored in the [ListStore].
  int size() {
    return _store.length;
  }

  /// Removes [entry] from the [ListStore]. Returns [true] if [entry] was
  /// removed from [ListStore] and [false] otherwise.
  bool remove(T entry) {
    return _store.remove(entry);
  }
}
