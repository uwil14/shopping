import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:shopping/Herramientas/PrimerPiso.dart';

class UnicoProvider with ChangeNotifier {


  bool _auth = false;

  bool get auth {
    return _auth;
  }

  set auth(bool valor) {
    _auth = valor;
    notifyListeners();
  }

  User? _user;

  User? get user {
    return _user;
  }

  set user(User? valor) {
    _user = valor;
    notifyListeners();
  }

  int _piso = 1;

  int get piso {
    return _piso;
  }

  set piso(int valor) {
    _piso = valor;
    notifyListeners();
  }

  String _foco = "1";

  String get foco {
    return _foco;
  }

  set foco(String valor) {
    _foco = valor;
    notifyListeners();
  }




  String _bloque = "1";

  String get bloque {
    return _bloque;
  }

  set bloque(String valor) {
    _bloque = valor;
    notifyListeners();
  }

}
