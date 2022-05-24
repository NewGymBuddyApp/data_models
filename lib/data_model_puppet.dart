import 'package:flutter_core/data_model.dart';

/// Class is used as a puppet to allow testing of DataModel through an empty
/// class.
class DataModelPuppet extends DataModel {
  DataModelPuppet(String id) : super(id);
  DataModelPuppet.create() : super.create();

  @override
  bool equals(Object other) {
    return identical(this, other) || other is DataModelPuppet && uid ==
        other.uid;
  }

  @override
  int hashcode() {
    return uid.hashCode;
  }
}
