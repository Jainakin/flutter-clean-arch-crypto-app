import '../../domain/entities/transaction.dart';

class TransactionModel extends Transaction {
  const TransactionModel({
    required super.hash,
    required super.time,
    required super.blockHeight,
    required super.blockIndex,
    required super.size,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    return TransactionModel(
      hash: json['hash'],
      time: json['time'],
      blockHeight: json['block_height'],
      blockIndex: json['block_index'],
      size: json['size'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'hash': hash,
      'time': time,
      'block_height': blockHeight,
      'block_index': blockIndex,
      'size': size,
    };
  }

  Transaction toEntity() {
    return Transaction(
      hash: hash,
      time: time,
      blockHeight: blockHeight,
      blockIndex: blockIndex,
      size: size,
    );
  }
}
