import 'package:flutter_core/data_model_puppet.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("Test 1 - Two separately initialised instances of DataModel have "
      "different uids", () {
    DataModelPuppet one = DataModelPuppet.create();
    DataModelPuppet two = DataModelPuppet.create();
    expect(one.uid != two.uid, true);
  });
}
