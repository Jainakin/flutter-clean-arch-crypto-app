import 'package:equatable/equatable.dart';

class Transaction extends Equatable {
  final String hash;
  final int time;
  final int blockHeight;
  final int blockIndex;
  final int size;

  const Transaction({
    required this.hash,
    required this.time,
    required this.blockHeight,
    required this.blockIndex,
    required this.size,
  });

  @override
  List<Object> get props => [hash, time, blockHeight, blockIndex, size];
}
