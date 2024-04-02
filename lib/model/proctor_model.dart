import 'package:hive/hive.dart';
part 'proctor_model.g.dart';

@HiveType(typeId: 0)
class ProctorModel {
  @HiveField(0)
  final String time;

  @HiveField(1)
  final String audio;

  @HiveField(2)
  final String object;

  const ProctorModel(this.object, this.audio, this.time);
}
