library flutter_core;

import 'dart:core';
import 'package:uuid/uuid.dart';

/// Generic class representation of all models. All models will share similar
/// attributes and methods and so this class acts as an interface for these
/// models to ensure standardisation is maintained. All attributes added in
/// implementations must either natively or manually implement [Comparable]
/// to allow for the dynamic sorting as implemented within [ListStore].
abstract class DataModel {
  /// The ID used to uniquely identify the model.
  String _uid = "";
  /// String used to give a name to the model. Name also acts in place of the
  /// title and is used as a way to identify a model.
  late String _name;
  /// Dictionary containing all attributes so that they can be referenced by
  /// a sorting algorithm. TO BE REPLACED BY toJson method once implemented.
  late Map<String, dynamic> attributes;

  /// Constructor for a pre-existing object which inherits [DataModel].
  DataModel(String id, String name) {
    _uid = id;
    _name = name;
  }

  /// Constructor for a new object inheriting [DataModel]. The [Uuid] class
  /// is used to generate the objects [uid] and is being done in this way so
  /// that the uid for an object is not hashcode dependent. This is important
  /// as models will be referenced in storage by their uid and if this was a
  /// dynamic value, it would become problematic to use the hashcode as the
  /// reference. As such, the UID and hashcode are two different, unique ways
  /// of checking the identity of a model.
  DataModel.create(String name) {
    var uuid = Uuid();
    _uid = uuid.v4();
    _name = name;
  }

  String get uid => _uid;
  String get name => _name;

  @override
  bool operator ==(Object other) {
    return equals(other);
  }

  /// Checks the equality of two objects. Returns [true] if the two objects
  /// are equal.
  bool equals(Object other);

  /// Calculates the hashcode of the object.
  int hashcode();

  /// Builds and returns a JSON representation of the object. This is used to
  /// allow the model to be easily inserted into Firebase storage.
  Map<String, dynamic> toJson();
}
