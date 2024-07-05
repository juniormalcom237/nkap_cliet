/// id : "651d0dc8a9ce300be5f07123"
/// name : "Sandra tchaks"
/// userCode : "INKAP975045"
/// password : "$2b$10$Q7SdHKcfyZXBTlYvtzK6FOF.HtcDWKMiX7Z.I3wm6H5NHZTNTROMG"
/// telephone : "697475110"
/// createdAt : "2023-10-04T07:01:28.930Z"
/// collectorId : "651b8d7a75eade1ab2865634"
/// transaction : [{"id":"651d1256220ca0373589e219","ref":"INKAP061558","type":"collect","amount":"50000","createdAt":"2023-10-04T07:20:54.489Z","clientId":"651d0dc8a9ce300be5f07123","collectorId":"651b8d7a75eade1ab2865634"}]

class User {
  User({
    String? id,
    String? name,
    String? userCode,
    String? password,
    String? telephone,
    String? createdAt,
    String? collectorId,
    List<Transaction>? transaction,
  }) {
    _id = id;
    _name = name;
    _userCode = userCode;
    _password = password;
    _telephone = telephone;
    _createdAt = createdAt;
    _collectorId = collectorId;
    _transaction = transaction;
  }

  User.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _userCode = json['userCode'];
    _password = json['password'];
    _telephone = json['telephone'];
    _createdAt = json['createdAt'];
    _collectorId = json['collectorId'];
    if (json['transaction'] != null) {
      _transaction = [];
      json['transaction'].forEach((v) {
        _transaction?.add(Transaction.fromJson(v));
      });
    }
  }
  String? _id;
  String? _name;
  String? _userCode;
  String? _password;
  String? _telephone;
  String? _createdAt;
  String? _collectorId;
  List<Transaction>? _transaction;
  User copyWith({
    String? id,
    String? name,
    String? userCode,
    String? password,
    String? telephone,
    String? createdAt,
    String? collectorId,
    List<Transaction>? transaction,
  }) =>
      User(
        id: id ?? _id,
        name: name ?? _name,
        userCode: userCode ?? _userCode,
        password: password ?? _password,
        telephone: telephone ?? _telephone,
        createdAt: createdAt ?? _createdAt,
        collectorId: collectorId ?? _collectorId,
        transaction: transaction ?? _transaction,
      );
  String? get id => _id;
  String? get name => _name;
  String? get userCode => _userCode;
  String? get password => _password;
  String? get telephone => _telephone;
  String? get createdAt => _createdAt;
  String? get collectorId => _collectorId;
  List<Transaction>? get transaction => _transaction;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['userCode'] = _userCode;
    map['password'] = _password;
    map['telephone'] = _telephone;
    map['createdAt'] = _createdAt;
    map['collectorId'] = _collectorId;
    if (_transaction != null) {
      map['transaction'] = _transaction?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// id : "651d1256220ca0373589e219"
/// ref : "INKAP061558"
/// type : "collect"
/// amount : "50000"
/// createdAt : "2023-10-04T07:20:54.489Z"
/// clientId : "651d0dc8a9ce300be5f07123"
/// collectorId : "651b8d7a75eade1ab2865634"

class Transaction {
  Transaction({
    String? id,
    String? ref,
    String? type,
    String? amount,
    String? createdAt,
    String? clientId,
    String? collectorId,
  }) {
    _id = id;
    _ref = ref;
    _type = type;
    _amount = amount;
    _createdAt = createdAt;
    _clientId = clientId;
    _collectorId = collectorId;
  }

  Transaction.fromJson(dynamic json) {
    _id = json['id'];
    _ref = json['ref'];
    _type = json['type'];
    _amount = json['amount'];
    _createdAt = json['createdAt'];
    _clientId = json['clientId'];
    _collectorId = json['collectorId'];
  }
  String? _id;
  String? _ref;
  String? _type;
  String? _amount;
  String? _createdAt;
  String? _clientId;
  String? _collectorId;
  Transaction copyWith({
    String? id,
    String? ref,
    String? type,
    String? amount,
    String? createdAt,
    String? clientId,
    String? collectorId,
  }) =>
      Transaction(
        id: id ?? _id,
        ref: ref ?? _ref,
        type: type ?? _type,
        amount: amount ?? _amount,
        createdAt: createdAt ?? _createdAt,
        clientId: clientId ?? _clientId,
        collectorId: collectorId ?? _collectorId,
      );
  String? get id => _id;
  String? get ref => _ref;
  String? get type => _type;
  String? get amount => _amount;
  String? get createdAt => _createdAt;
  String? get clientId => _clientId;
  String? get collectorId => _collectorId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['ref'] = _ref;
    map['type'] = _type;
    map['amount'] = _amount;
    map['createdAt'] = _createdAt;
    map['clientId'] = _clientId;
    map['collectorId'] = _collectorId;
    return map;
  }
}
