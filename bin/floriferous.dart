import 'package:floriferous/floriferous.dart' as floriferous;
import 'dart:io';

void main(List<String> arguments) {
  print('Hello world: ${floriferous.calculate()}!');
  String? line = stdin.readLineSync();
  print('Hello $line');
}
