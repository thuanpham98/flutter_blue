import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:flutter_blue/flutter_blue_platform_interface.dart';
import 'package:flutter_blue/flutter_blue_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterBluePlatform
    with MockPlatformInterfaceMixin
    implements FlutterBluePlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FlutterBluePlatform initialPlatform = FlutterBluePlatform.instance;

  test('$MethodChannelFlutterBlue is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterBlue>());
  });

  test('getPlatformVersion', () async {
    FlutterBlue flutterBluePlugin = FlutterBlue();
    MockFlutterBluePlatform fakePlatform = MockFlutterBluePlatform();
    FlutterBluePlatform.instance = fakePlatform;

    expect(await flutterBluePlugin.getPlatformVersion(), '42');
  });
}
