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
class CadastroCandidatoPage implements OnActivate {
  final CandidatoService _candidatoService = CandidatoService();
  final Router _router;
  Candidato candidato = Candidato();
  bool isNew = false;

  CadastroCandidatoPage(this._router);
  void salvar() async {
    try {
      if (isNew) {
        await _candidatoService.cadastrar(candidato);
      } else {
        await _candidatoService.atualizar(candidato);
      }

      window.alert('Salvo');
      _router.navigate(RoutePaths.listaCandidato.toUrl());
    } catch (e) {
      window.alert('Erro ao salvar, $e');
    }
  }

  void getById(int id) async {
    try {
      candidato = await _candidatoService.getById(id);
    } catch (e) {
      window.alert('Erro ao obter, $e');
    }
  }

  @override
  void onActivate(RouterState? previous, RouterState current) {
    final id = int.tryParse(current.parameters['id'] ?? '');
    if (id != null) {
      isNew = false;
      getById(id);
    } else {
      isNew = true;
    }
    print('$id inNew $isNew');
  }
}
