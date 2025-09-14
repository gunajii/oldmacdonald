class DrugDefaults {
  final Map<String, Map<String, int>> _map;

  DrugDefaults._(this._map);

  factory DrugDefaults.fromJson(Map<String, dynamic> json) {
    final m = <String, Map<String, int>>{};
    json.forEach((k, v) {
      final meat = (v['meatDays'] as num?)?.toInt() ?? 0;
      final dairy = (v['dairyDays'] as num?)?.toInt() ?? 0;
      m[k] = {'meatDays': meat, 'dairyDays': dairy};
    });
    return DrugDefaults._(m);
  }

  Map<String, dynamic> toJson() {
    final out = <String, dynamic>{};
    _map.forEach((k, v) {
      out[k] = {'meatDays': v['meatDays'], 'dairyDays': v['dairyDays']};
    });
    return out;
  }

  int meatDaysFor(String drug) => _map[drug]?['meatDays'] ?? 0;
  int dairyDaysFor(String drug) => _map[drug]?['dairyDays'] ?? 0;

  void setFor(String drug, int meatDays, int dairyDays) {
    _map[drug] = {'meatDays': meatDays, 'dairyDays': dairyDays};
  }

  List<String> get drugs => _map.keys.toList();
}