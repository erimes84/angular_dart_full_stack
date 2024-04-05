// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Candidato {
  int id;
  String nome;
  String telefone;

  Candidato({
    this.id = -1,
    this.nome = '',
    this.telefone = '',
  });

  factory Candidato.fromMap(Map<String, dynamic> data) {
    return Candidato(
      id: data['id'],
      nome: data['nome'],
      telefone: data['telefone'],
    );
  }
  Map<String, dynamic> topMap() {
    return {'id': id, 'nome': nome, 'telefone': telefone};
  }
}
