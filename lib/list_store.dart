import 'package:flutter_core/data_model.dart';

/// Model representation of a highly-customisable list which acts as a Set.
/// Custom implementation allows many other operations to be hidden behind
/// this object that would usually require the combination of many objects.
class ListStore<T extends DataModel> {
  /// The Set holding the instances of [DataModel].
  late Set<T> _store;

  ListStore() {
    _store = Set();
  }
}
