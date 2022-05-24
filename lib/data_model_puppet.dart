import 'package:flutter_core/data_model.dart';

/// Class is used as a puppet to allow testing of DataModel through an empty
/// class.
class DataModelPuppet extends DataModel {

  DataModelPuppet(String id, String name) : super(id, name) {
    attributes = {
      "uid" : uid,
      "name" : this.name
    };
  }
  DataModelPuppet.create(String name) : super.create(name) {
    attributes = {
      "uid" : uid,
      "name" : this.name
    };
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
