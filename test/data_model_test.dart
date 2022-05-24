import 'package:flutter_core/data_model_puppet.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late DataModelPuppet one;
  late DataModelPuppet two;

  setUp((){
    one = DataModelPuppet.create("one");
    two = DataModelPuppet.create("two");
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
    DataModelPuppet three = DataModelPuppet(one.uid, "one");
    expect(one.hashcode(), equals(three.hashcode()));
  });

  test("Test 4 - DataModel can be correctly instantiated from a JSON", (){
    Map values = {
      "uid" : "uid",
      "name" : "test"
    };
    DataModelPuppet fromJson = DataModelPuppet.fromJson(values);
    expect(fromJson.uid, equals("uid"));
    expect(fromJson.name, equals("test"));
  });
}
