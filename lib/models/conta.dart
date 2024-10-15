class Conta {
  final int id;
  final String titular;
  final double saldo;

  Conta({required this.id, required this.titular, required this.saldo});

  factory Conta.fromJson(Map<String, dynamic> json) {
    return Conta(
      id: json['id'],
      titular: json['titular'],
      saldo: json['saldo'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'titular': titular,
      'saldo': saldo,
    };
  }
}