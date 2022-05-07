library flutter_core;

import 'package:uuid/uuid.dart';

/// Generic class representation of all models. All models will share similar
/// attributes and methods and so this class acts as an interface for these
/// models to ensure standardisation is maintained.
abstract class DataModel {
  /// The ID used to uniquely identify the model.
  String _uid = "";

  /// Constructor for a pre-existing object which inherits [DataModel].
  DataModel(String id) {
    _uid = id;
  }

  /// Constructor for a new object inheriting [DataModel]. The [Uuid] class
  /// is used to generate the objects [uid] and is being done in this way so
  /// that the uid for an object is not hashcode dependent. This is important
  /// as models will be referenced in storage by their uid and if this was a
  /// dynamic value, it would become problematic to use the hashcode as the
  /// reference. As such, the UID and hashcode are two different, unique ways
  /// of checking the identity of a model.
  DataModel.create() {
    var uuid = Uuid();
    _uid = uuid.v4();
  }

  String get uid => _uid;

}
