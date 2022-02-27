import 'package:flutter/material.dart';

class Saldo extends ChangeNotifier {
  double valor;

  Saldo(this.valor);

  void adiciona(double valor) {
    this.valor += valor;

    notifyListeners();
  }

  void subtrai(double valor) {
    this.valor -= valor;

    if (this.valor < 0) {
      this.valor = 0;
    }

    notifyListeners();
  }

  @override
  String toString() {
    return 'R\$ $valor';
  }
}
