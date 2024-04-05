import 'dart:html';

import 'package:meu_proj_frontend/src/modules/candidato/services/candidato_service.dart';
import 'package:meu_proj_frontend/src/shared/models/candidato.dart';
import 'package:meu_proj_frontend/src/shared/rotas/route_definitions.dart';
import 'package:ngdart/angular.dart';
import 'package:ngforms/ngforms.dart';
import 'package:ngrouter/angular_router.dart';

@Component(
  selector: 'cadastro-candidato-page',
  templateUrl: 'cadastro_candidato.html',
  directives: [
    coreDirectives,
    formDirectives,
  ],
)
class CadastroCandidatoPage {
  final CandidatoService _candidatoService = CandidatoService();
  final Router _router;

  Candidato candidato = Candidato();

  CadastroCandidatoPage(this._router);
  void salvar() async {
    try {
      await _candidatoService.cadastrar(candidato.topMap());
      window.alert('Salvo');
      _router.navigate(RoutePaths.listaCandidato.toUrl());
    } catch (e) {
      window.alert('Erro ao salvar, $e');
    }
  }
}
