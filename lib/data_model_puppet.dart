import 'package:data_models/data_model.dart';

/// Class is used as a puppet to allow testing of DataModel through an empty
/// class.
class DataModelPuppet extends DataModel {

  /// Constructor for a pre-existing object which inherits [DataModel].
  DataModelPuppet(String id, String name) : super(id, name);

  /// Constructor for a new object inheriting [DataModel]. The [Uuid] class
  /// is used to generate the objects [uid] and is being done in this way so
  /// that the uid for an object is not hashcode dependent. This is important
  /// as models will be referenced in storage by their uid and if this was a
  /// dynamic value, it would become problematic to use the hashcode as the
  /// reference. As such, the UID and hashcode are two different, unique ways
  /// of checking the identity of a model.
  DataModelPuppet.create(String name) : super.create(name);

  /// Constructor instantiating an instance of the object from a JSON object.
  DataModelPuppet.fromJson(Map values) : super.fromJson(values) {
    uid = values["uid"];
    name = values["name"];
  }

  @override
  bool equals(Object other) {
    return identical(this, other) || other is DataModelPuppet && uid ==
        other.uid && name == other.name;
  }

  @override
  int hashcode() {
    return Object.hash(uid, name);
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "uid" : uid,
      "name" : name
    };
  }
}
