// Imports the Flutter Driver API.
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Login form tests', () {
    late FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    final filedFinderEmail = find.byValueKey('filedEmail');
    final filedFinderPhone = find.byValueKey('filedPhone');
    final filedFinderSubmit = find.text('Отправить');

    test('Test Email field', () async{
      await driver.tap(filedFinderEmail);
      await driver.waitFor(find.text(''));
      await driver.enterText('test@test.com');
      await driver.waitFor(find.text('test@test.com'));
    });

    test('Test Phone field', () async{
      await driver.tap(filedFinderPhone);
      await driver.waitFor(find.text(''));
      await driver.enterText('89520377390');
      await driver.waitFor(find.text('89520377390'));
    });

    test('Test Submit field', () async{
      await driver.tap(filedFinderSubmit);
    });

    test('Success text', () async{
      final success = find.text('Добро пожаловать');
      expect(await driver.getText(success), 'Добро пожаловать');
    });
  });

  group('Register form tests', () {
    late FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    final filedFinderFirstName = find.byValueKey('firstName');
    final filedFinderLastName = find.byValueKey('lastName');
    final filedFinderPhone = find.byValueKey('filedPhone');
    final filedFinderEmail = find.byValueKey('filedEmail');
    final filedFinderSubmit = find.text('Отправить');
    final filedFinderSwitch = find.byValueKey('Registration');


    test('Test Switch field', () async{
      await driver.tap(filedFinderSwitch);
    });

    test('Test firstName field', () async{
      await driver.tap(filedFinderFirstName);
      await driver.waitFor(find.text(''));
      await driver.enterText('Jack');
      await driver.waitFor(find.text('Jack'));
    });

    test('Test lastName field', () async{
      await driver.tap(filedFinderLastName);
      await driver.waitFor(find.text(''));
      await driver.enterText('Jordan');
      await driver.waitFor(find.text('Jordan'));
    });

    test('Test Phone field', () async{
      await driver.tap(filedFinderPhone);
      await driver.waitFor(find.text(''));
      await driver.enterText('89520377390');
      await driver.waitFor(find.text('89520377390'));
    });

    test('Test Email field', () async{
      await driver.tap(filedFinderEmail);
      await driver.waitFor(find.text(''));
      await driver.enterText('test@test.com');
      await driver.waitFor(find.text('test@test.com'));
    });

    test('Test Submit field', () async{
      await driver.tap(filedFinderSubmit);
    });

    test('Success text', () async{
      final success = find.text('Вы успешно зарегистрировались');
      expect(await driver.getText(success), 'Вы успешно зарегистрировались');
    });
  });
}
