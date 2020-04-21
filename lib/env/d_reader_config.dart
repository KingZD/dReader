import 'package:json_annotation/json_annotation.dart';

@JsonSerializable(createToJson: false)
class DReaderConfig {
  final String env;
  final bool debug;

  DReaderConfig({this.env, this.debug});


}
