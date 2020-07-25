
import 'package:flutter_test/flutter_test.dart';
import 'package:boltiot/boltiot.dart';

void main() {
  test('Returns some value', () {
    final Bolt mybolt = new Bolt('your_bolt_api', 'your_device_id');
    var result = mybolt.isOnline();
    print(result);
  });
}
