import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping/Provider/UnicoProvider.dart';
import 'package:sizer/sizer.dart';

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
      child: Container(
        width: 80.w,
        margin: EdgeInsets.only(left: 20.w),
        child: Center(
          child: datosProvider.planta,
        ),
      ),
    );
  }
}
