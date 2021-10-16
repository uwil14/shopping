import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping/Modelo/Tienda.dart';
import 'package:sizer/sizer.dart';

class Bloque extends StatefulWidget {
  final int bloque;
  final int tipo;
  final List<int> tiendas;

  Bloque(this.tipo, this.bloque, this.tiendas);

  @override
  _BloqueState createState() => _BloqueState(tipo, bloque, tiendas);
}

class _BloqueState extends State<Bloque> {
  final int tipo;
  final int bloque;
  final List<int> tiendas;

  _BloqueState(this.tipo, this.bloque, this.tiendas);

  @override
  Widget build(BuildContext context) {
    List<Tienda> tiendaProvider = Provider.of<List<Tienda>>(context);
    Widget tienda(int index) {
      return Expanded(
          child: tiendas.elementAt(index) == 0
              ? Container(
                  color: Colors.grey,
                  margin: EdgeInsets.all(0.05.h),
                  width: MediaQuery.of(context).orientation ==
                          Orientation.landscape
                      ? 5.w
                      : 4.w,
                )
              : Container(
                  margin: EdgeInsets.all(0.05.h),
                  width: MediaQuery.of(context).orientation ==
                          Orientation.landscape
                      ? 5.w
                      : 4.w,
                  color: tiendaProvider.any((element) =>
                          element.tienda == tiendas.elementAt(index))
                      ? Colors.red
                      : Colors.green,
                  child: Center(
                    child: Text(
                      "T - " + tiendas.elementAt(index).toString(),
                      style: TextStyle(
                        fontFamily: "MontserratMediumItalic",
                        fontSize: MediaQuery.of(context).orientation ==
                                Orientation.landscape
                            ? 1.sp
                            : 1.8.sp,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ));
    }

    return Container(
      padding: EdgeInsets.all(0.3.h),
      margin: EdgeInsets.all(0.1.h),
      height: (MediaQuery.of(context).orientation == Orientation.landscape
          ? 5.5.h
          : 4.h),
      width: tipo.w *
          (MediaQuery.of(context).orientation == Orientation.landscape
              ? 2
              : 3.9),
      child: Container(
          child: Stack(
        children: [
          Row(
            children: [
              tipo >= 1
                  ? Expanded(
                      child: Column(
                      children: [
                        tienda(0),
                        tienda(1),
                      ],
                    ))
                  : Container(),
              tipo >= 2
                  ? Expanded(
                      child: Column(
                      children: [
                        tienda(2),
                        tienda(3),
                      ],
                    ))
                  : Container(),
              tipo >= 3
                  ? Expanded(
                      child: Column(
                      children: [
                        tienda(4),
                        tienda(5),
                      ],
                    ))
                  : Container(),
              tipo >= 4
                  ? Expanded(
                      child: Column(
                      children: [
                        tienda(6),
                        tienda(7),
                      ],
                    ))
                  : Container(),
              tipo >= 5
                  ? Expanded(
                      child: tiendas.elementAt(8) == tiendas.elementAt(9)
                          ? Column(
                              children: [
                                tienda(8),
                              ],
                            )
                          : Column(
                              children: [
                                tienda(8),
                                tienda(9),
                              ],
                            ))
                  : Container(),
              tipo >= 6
                  ? Expanded(
                      child: tiendas.elementAt(10) == tiendas.elementAt(11)
                          ? Column(
                              children: [
                                tienda(10),
                              ],
                            )
                          : Column(
                              children: [
                                tienda(10),
                                tienda(11),
                              ],
                            ))
                  : Container(),
              tipo >= 7
                  ? Expanded(
                      child: Column(
                      children: [
                        tienda(12),
                        tienda(13),
                      ],
                    ))
                  : Container(),
            ],
          ),
          bloque != 0
              ? Container(
                  alignment: Alignment.center,
                  child: Text(
                    "Bloque " + bloque.toString(),
                    style: TextStyle(
                        fontFamily: "MontserratMediumItalic",
                        fontSize: MediaQuery.of(context).orientation ==
                                Orientation.landscape
                            ? 1.sp
                            : 3.sp,
                        color: Colors.black,
                        backgroundColor: Colors.white54),
                  ),
                )
              : Container()
        ],
      )),
    );
  }
}
