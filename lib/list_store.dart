import 'package:flutter_core/data_model.dart';

/// Model representation of a highly-customisable list which acts as a Set.
/// Custom implementation allows many other operations to be hidden behind
/// this object that would usually require the combination of many objects.
class ListStore<T extends DataModel> {
  /// The [List] holding the instances of [DataModel].
  late List<T> _store;

  /// Constructor for the [ListStore]. Initialises the privatised [List].
  ListStore() {
    _store = [];
  }

  /// Adds a new element to the [ListStore]. Returns [true] if the value was
  /// successfully added and was not already in the set
  bool add(T element) {
    if (_store.contains(element)) {
      return false;
    } else {
      _store.add(element);
      return true;
    }
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
    _store = [];
  }

  /// Returns a single entry from the [ListStore].
  DataModel get(String uid) {
    return _store.singleWhere((element) => element.uid == uid);
  }

  /// Returns the [ListStore] as a List used for iteration where access
  /// to the entire list is needed.
  List<T> getList() {
    return _store.toList();
  }

  /// Returns a list containing the UID of all elements in the [ListStore].
  List<String> getAllUID() {
    List<String> uids = [];
    for (var element in _store) {
      uids.add(element.uid);
    }
    return uids;
  }

  /// Sorts the [ListStore] using the provided [comparator] and sorting
  /// direction. [comparator] is a string referencing an attribute within the
  /// list element type and must implement [Comparable] in order to be valid.
  void sort(String comparator, bool ascending) {
    if (ascending) {
      _store.sort((a,b) => a.attributes[comparator].compareTo(
          b.attributes[comparator]
      ));
    } else {
      _store.sort((a,b) => b.attributes[comparator].compareTo(
          a.attributes[comparator]
      ));
    }
  }
}
