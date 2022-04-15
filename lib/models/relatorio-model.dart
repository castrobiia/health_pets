class RelatorioModel {
  late String name;
  late String description;
  late double total;
  late bool isIncome;
  late DateTime createdAt;

  RelatorioModel({
    required this.name,
    required this.description,
    required this.total,
    required this.isIncome,
    required this.createdAt,
  });

  RelatorioModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    total = json['total'];
    isIncome = json['is_income'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['name'] = name;
    data['description'] = description;
    data['total'] = total;
    data['is_income'] = isIncome;
    data['created_at'] = createdAt;
    return data;
  }
}

final List<RelatorioModel> recentTransaction = [
  RelatorioModel(
    name: 'Coleira',
    description: 'Subscription',
    total: 8.99,
    isIncome: false,
    createdAt: DateTime(2021, 3, 4),
  ),
  RelatorioModel(
    name: 'Ração',
    description: 'Transfer',
    total: 120.00,
    isIncome: false,
    createdAt: DateTime(2021, 3, 7),
  ),
];

final List<RelatorioModel> incomeTransaction = [
  RelatorioModel(
    name: 'Lacinho',
    description: 'Bank Transfer',
    total: 85.50,
    isIncome: true,
    createdAt: DateTime(2021, 3, 10),
  ),
  RelatorioModel(
    name: 'Sache',
    description: 'Bank Transfer',
    total: 240.00,
    isIncome: true,
    createdAt: DateTime(2021, 3, 15),
  ),
  RelatorioModel(
    name: 'Remédio',
    description: 'Bank Transfer',
    total: 92.50,
    isIncome: true,
    createdAt: DateTime(2021, 2, 4),
  ),
];

final List<RelatorioModel> expensesTransaction = [
  RelatorioModel(
    name: 'Ração',
    description: 'Subscription',
    total: 8.99,
    isIncome: false,
    createdAt: DateTime(2021, 3, 4),
  ),
  RelatorioModel(
    name: 'Lacinho',
    description: 'Transfer',
    total: 120.00,
    isIncome: false,
    createdAt: DateTime(2021, 3, 7),
  ),
];

final List<RelatorioModel> allTransaction = [
  RelatorioModel(
    name: 'Sache',
    description: 'Subscription',
    total: 8.99,
    isIncome: false,
    createdAt: DateTime(2021, 3, 4),
  )
];
