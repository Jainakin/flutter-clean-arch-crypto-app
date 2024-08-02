import '../../domain/entities/tezos_transaction.dart';

class TezosTransactionModel extends TezosTransaction {
  const TezosTransactionModel({
    required super.id,
    required super.level,
    required super.timestamp,
    required super.hash,
  });

  factory TezosTransactionModel.fromJson(Map<String, dynamic> json) {
    return TezosTransactionModel(
      id: json['id'],
      level: json['level'],
      timestamp: json['timestamp'],
      hash: json['hash'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'level': level,
      'timestamp': timestamp,
      'hash': hash,
    };
  }

  TezosTransaction toEntity() {
    return TezosTransaction(
      id: id,
      level: level,
      timestamp: timestamp,
      hash: hash,
    );
  }
}
