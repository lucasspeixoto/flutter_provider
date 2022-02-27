import 'package:bytebank/models/transferencias.dart';
import 'package:bytebank/screens/transferencia/lista.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

const String _titulo = 'Últimas transferências';

class UltimasTransferencias extends StatelessWidget {
  const UltimasTransferencias({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Text(
          _titulo,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        Consumer<Transferencias>(builder: (context, transferencias, child) {
          final _ultimas = transferencias.transferencias.reversed.toList();
          final int _quantidade = transferencias.transferencias.length;

          if (_quantidade == 0) {
            return const SemTransferenciasCadastrads();
          }

          int tamanho = 2;
          if (_quantidade <= 5) {
            tamanho = _quantidade;
          }

          return ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: tamanho,
            shrinkWrap: true,
            itemBuilder: (context, indice) {
              final transferencia = _ultimas[indice];
              return ItemTransferencia(transferencia);
            },
          );
        }),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return const ListaTransferencias();
              }),
            );
          },
          child: const Text('Ver todas Transferências'),
        ),
      ],
    );
  }
}

class SemTransferenciasCadastrads extends StatelessWidget {
  const SemTransferenciasCadastrads({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Card(
      margin: EdgeInsets.all(40),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Text(
          'Sem Transferências cadastrada no momento!',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
