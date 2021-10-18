import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping/Modelo/Tienda.dart';
import 'package:shopping/Provider/UnicoProvider.dart';
import 'package:sizer/sizer.dart';

class Administracion extends StatefulWidget {
  const Administracion({Key? key}) : super(key: key);

  @override
  _AdministracionState createState() => _AdministracionState();
}

class _AdministracionState extends State<Administracion> {
  @override
  Widget build(BuildContext context) {
    List<Tienda> tiendaProvider = Provider.of<List<Tienda>>(context);
    final datosProvider = Provider.of<UnicoProvider>(context);
    final firestoreInstance = FirebaseFirestore.instance;
    final PrimerTiendas = List.generate(
        602,
        (index) => DropdownMenuItem(
              value: (index + 1).toString(),
              child: Text("T - " + (index + 1).toString(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "MontserratMediumItalic",
                  )),
            ));
    final PrimerBloque = List.generate(
        99,
        (index) => DropdownMenuItem(
              value: (index + 1).toString(),
              child: Text("B - " + (index + 1).toString(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "MontserratMediumItalic",
                  )),
            ));

    return datosProvider.auth
        ? (MediaQuery.of(context).orientation == Orientation.landscape
            ? Container(
                margin: EdgeInsets.only(left: 80.w),
                width: 20.w,
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black26, blurRadius: 5, spreadRadius: 5)
                    ],
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 2.w, vertical: 5.h),
                      child: Text(
                        "Sistema de Administración de Tiendas",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 5.sp,
                          fontFamily: "MontserratExtraBold",
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 2.w),
                              child: Text(
                                "Escoja una Tienda",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 3.sp,
                                  fontFamily: "MontserratMediumItalic",
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                                margin: EdgeInsets.only(
                                  left: 1.w,
                                  right: 1.w,
                                ),
                                child: DropdownButtonFormField(
                                  icon: Icon(Icons.arrow_downward),
                                  decoration: InputDecoration(
                                      hintText: 'Escoga un Bloque',
                                      border: OutlineInputBorder(),
                                      labelText: "Bloque"),
                                  value: datosProvider.bloque,
                                  isExpanded: true,
                                  onChanged: (value) {
                                    setState(() {
                                      datosProvider.bloque = value.toString();
                                    });
                                  },
                                  items: PrimerBloque,
                                )),
                          ),
                          Expanded(
                            child: Container(
                                margin: EdgeInsets.only(
                                  left: 1.w,
                                  right: 1.w,
                                ),
                                child: DropdownButtonFormField(
                                  icon: Icon(Icons.arrow_downward),
                                  decoration: InputDecoration(
                                      hintText: 'Escoga una Tienda',
                                      border: OutlineInputBorder(),
                                      labelText: "Tienda"),
                                  value: datosProvider.foco,
                                  isExpanded: true,
                                  onChanged: (value) {
                                    datosProvider.foco = value.toString();
                                  },
                                  items: PrimerTiendas,
                                )),
                          ),
                          Expanded(
                            child: Container(
                                width: 18.w,
                                margin: EdgeInsets.symmetric(
                                    horizontal: 1.w, vertical: 2.h),
                                child: ElevatedButton(
                                    onPressed: () {
                                      int x = 0;

                                      tiendaProvider.any((element) =>
                                              element.tienda ==
                                              int.parse(datosProvider.foco))
                                          ? x = 0
                                          : x = 1;

                                      firestoreInstance
                                          .collection('tiendas')
                                          .doc('P' +
                                              datosProvider.piso.toString() +
                                              'T' +
                                              datosProvider.foco.toString())
                                          .set({
                                        'planta': datosProvider.piso,
                                        'estado': x,
                                        'tienda': int.parse(datosProvider.foco)
                                      });
                                    },
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          side: BorderSide(
                                              color: tiendaProvider.any(
                                                      (element) =>
                                                          element.tienda ==
                                                          int.parse(
                                                              datosProvider
                                                                  .foco))
                                                  ? Colors.green
                                                  : Colors.red)),

                                      primary: tiendaProvider.any((element) =>
                                              element.tienda ==
                                              int.parse(datosProvider.foco))
                                          ? Colors.green
                                          : Colors.red, // background
                                      onPrimary: Colors.white,
                                    ),
                                    child: Text(
                                      "Cambiar",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: "MontserratSemiBold",
                                        color: Colors.white,
                                      ),
                                    ))),
                          ),
                          Expanded(
                            child: Container(
                                width: 18.w,
                                margin: EdgeInsets.symmetric(
                                    horizontal: 1.w, vertical: 2.h),
                                child: ElevatedButton(
                                    onPressed: () {
                                      datosProvider.auth = false;
                                    },
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          side:
                                              BorderSide(color: Colors.black)),

                                      primary: Colors.black, // background
                                      onPrimary: Colors.white,
                                    ),
                                    child: Text(
                                      "Cerrar Sesión",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: "MontserratSemiBold",
                                        color: Colors.white,
                                      ),
                                    ))),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 5.h),
                      child: Image.asset(
                        "images/logo.png",
                        height: 20.h,
                      ),
                    )
                  ],
                ),
              )
            : Container(
      margin: EdgeInsets.only(top: 80.h),
      width: 100.w,
      height: 20.h,
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black26, blurRadius: 5, spreadRadius: 5)
          ],
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              bottomLeft: Radius.circular(10))),
      child: Row(
        children: [
          Container(
            width: 30.w,
            margin:
            EdgeInsets.symmetric(horizontal: 1.w, vertical: 1.h),
            child: Text(
              "Sistema de Administración de Tiendas",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 10.sp,
                fontFamily: "MontserratExtraBold",
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Container(
                          margin: EdgeInsets.only(
                            top: 1.h,
                            bottom: 1.h,
                          ),
                          child: DropdownButtonFormField(
                            icon: Icon(Icons.arrow_downward),
                            decoration: InputDecoration(
                                hintText: 'Escoga un Bloque',
                                border: OutlineInputBorder(),
                                labelText: "Bloque"),
                            value: datosProvider.bloque,
                            isExpanded: true,
                            onChanged: (value) {
                              setState(() {
                                datosProvider.bloque = value.toString();
                              });
                            },
                            items: PrimerBloque,
                          )),
                    ),
                    Expanded(
                      child: Container(
                          margin: EdgeInsets.only(
                            top: 1.h,
                            bottom: 1.h,
                          ),
                          child: DropdownButtonFormField(
                            icon: Icon(Icons.arrow_downward),
                            decoration: InputDecoration(
                                hintText: 'Escoga una Tienda',
                                border: OutlineInputBorder(),
                                labelText: "Tienda"),
                            value: datosProvider.foco,
                            isExpanded: true,
                            onChanged: (value) {
                              datosProvider.foco = value.toString();
                            },
                            items: PrimerTiendas,
                          )),
                    ),],
                )),
               Expanded(child: Column(children: [Expanded(
                 child: Container(
                     width: 30.w,
                     margin: EdgeInsets.symmetric(
                         horizontal: 1.w, vertical: 1.h),
                     child: ElevatedButton(
                         onPressed: () {
                           int x = 0;

                           tiendaProvider.any((element) =>
                           element.tienda ==
                               int.parse(datosProvider.foco))
                               ? x = 0
                               : x = 1;

                           firestoreInstance
                               .collection('tiendas')
                               .doc('P' +
                               datosProvider.piso.toString() +
                               'T' +
                               datosProvider.foco.toString())
                               .set({
                             'planta': datosProvider.piso,
                             'estado': x,
                             'tienda': int.parse(datosProvider.foco)
                           });
                         },
                         style: ElevatedButton.styleFrom(
                           shape: RoundedRectangleBorder(
                               borderRadius:
                               BorderRadius.circular(5.0),
                               side: BorderSide(
                                   color: tiendaProvider.any(
                                           (element) =>
                                       element.tienda ==
                                           int.parse(
                                               datosProvider
                                                   .foco))
                                       ? Colors.green
                                       : Colors.red)),

                           primary: tiendaProvider.any((element) =>
                           element.tienda ==
                               int.parse(datosProvider.foco))
                               ? Colors.green
                               : Colors.red, // background
                           onPrimary: Colors.white,
                         ),
                         child: Text(
                           "Cambiar",
                           textAlign: TextAlign.center,
                           style: TextStyle(
                             fontFamily: "MontserratSemiBold",
                             color: Colors.white,
                           ),
                         ))),
               ),
                 Expanded(
                   child: Container(
                       width: 30.w,
                       margin: EdgeInsets.symmetric(
                           horizontal: 1.w, vertical: 1.h),
                       child: ElevatedButton(
                           onPressed: () {
                             datosProvider.auth = false;
                           },
                           style: ElevatedButton.styleFrom(
                             shape: RoundedRectangleBorder(
                                 borderRadius:
                                 BorderRadius.circular(5.0),
                                 side:
                                 BorderSide(color: Colors.black)),

                             primary: Colors.black, // background
                             onPrimary: Colors.white,
                           ),
                           child: Text(
                             "Cerrar Sesión",
                             textAlign: TextAlign.center,
                             style: TextStyle(
                               fontFamily: "MontserratSemiBold",
                               color: Colors.white,
                             ),
                           ))),
                 )],))

              ],
            ),
          ),

        ],
      ),
    ))
        : Container();
  }
}
