import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shopping/Herramientas/Administracion.dart';
import 'package:shopping/Herramientas/Informacion.dart';
import 'package:shopping/Modelo/Tienda.dart';
import 'Planos.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark));
    Stream<List<Tienda>> getTiendas() {
      final firestoreInstance = FirebaseFirestore.instance;

      return firestoreInstance
          .collection('tiendas')
          .where("estado", isNotEqualTo: 0)
          .snapshots()
          .map((snapshot) {
        return snapshot.docs
            .map((document) => Tienda(
                  document['estado'],
                  document['tienda'],
                  document['planta'],
                ))
            .toList();
      });
    }

    return StreamProvider<List<Tienda>>.value(
        value: getTiendas(),
        initialData: [],
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Stack(
            children: [

              Planos(),
              Informacion(),
              Administracion()
            ],
          ),
        ));
  }
}
