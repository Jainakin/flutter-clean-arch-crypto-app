import 'package:equatable/equatable.dart';

class TezosTransaction extends Equatable {
  final int id;
  final int level;
  final String timestamp;
  final String hash;

  const TezosTransaction({
    required this.id,
    required this.level,
    required this.timestamp,
    required this.hash,
  });

  @override
  List<Object> get props => [
        id,
        level,
        timestamp,
        hash,
      ];
}
