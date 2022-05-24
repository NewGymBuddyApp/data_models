import 'package:flutter_core/data_model_puppet.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late DataModelPuppet one;
  late DataModelPuppet two;

  setUp((){
    one = DataModelPuppet.create();
    two = DataModelPuppet.create();
  });

  test("Test 1 - Two separately initialised instances of DataModel have "
      "different uids", () {
    expect(one.uid != two.uid, true);
  });
}
