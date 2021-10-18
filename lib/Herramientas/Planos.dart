import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping/Herramientas/SegundoPiso.dart';
import 'package:shopping/Herramientas/TercerPiso.dart';
import 'package:shopping/Provider/UnicoProvider.dart';
import 'package:sizer/sizer.dart';

import 'PrimerPiso.dart';

class Planos extends StatefulWidget {
  const Planos({Key? key}) : super(key: key);

  @override
  _PlanosState createState() => _PlanosState();
}

class _PlanosState extends State<Planos> {
  @override
  Widget build(BuildContext context) {
    final TransformationController interactive = TransformationController();

    final datosProvider = Provider.of<UnicoProvider>(context);

    return InteractiveViewer(
      transformationController: interactive,

      maxScale: 10,
      child: datosProvider.piso == 1

          ? PrimerPiso()
          : datosProvider.piso == 2
              ? SegundoPiso()
              : TercerPiso(),
    );
  }
}
