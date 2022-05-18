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

  /// Adds a new element to the [ListStore]. Returns [true] if the value was
  /// successfully added and was not already in the set
  bool add(T element) {
    return _store.add(element);
  }

  /// Checks the [ListStore] for membership of the provided [element]. Returns
  /// [true] if [T] is a member.
  bool contains(T element) {
    return _store.contains(element);
  }

  /// Returns the number of elements stored in the [ListStore].
  int size() {
    return _store.length;
  }

  /// Removes [element] from the [ListStore]. Returns [true] if [element] was
  /// removed from [ListStore] and [false] otherwise.
  bool remove(T element) {
    return _store.remove(element);
  }
  
  /// Empties the [ListStore] of all elements.
  void empty() {
    _store = Set();
  }
}
