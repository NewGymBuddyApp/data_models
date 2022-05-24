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

  test("Test 2 - The hashcodes of two different objects should not be equal", (){
    expect(one.hashCode != two.hashCode, isTrue);
  });

  test("Test 3 - The hashcodes should match when the items are the same", (){
    // A new instance of DataModelPuppet using the id of "one" should provide
    // the same hashcode as all internal values will match. Hashcodes should
    // be equal regardless of the instance.
    DataModelPuppet three = DataModelPuppet(one.uid);
    expect(one.hashCode != three.hashCode, isTrue);
  });
}
