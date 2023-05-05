import 'package:flutter/material.dart';

class CreatingTerrain extends StatefulWidget {
  final Function changeAction;
  const CreatingTerrain({super.key, required this.changeAction});

  @override
  State<CreatingTerrain> createState() => _CreatingTerrainState();
}

class _CreatingTerrainState extends State<CreatingTerrain> {
  Future<bool> _onBackPressed() {
    widget.changeAction("Visualizar");
    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        /*onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFFF1F4F8),
        appBar: AppBar(
          backgroundColor: Color(0xB91F6700),
          automaticallyImplyLeading: true,
          title: Text(
            'Meus anuncios',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Outfit',
                  color: Colors.white,
                  fontSize: 28.0,
                  fontWeight: FontWeight.normal,
                ),
          ),
          actions: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
              child: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 60.0,
                icon: const Icon(
                  Icons.account_circle,
                  color: Colors.white,
                  size: 30.0,
                ),
                onPressed: () {
                  print('IconButton pressed ...');
                },
              ),
            ),
          ],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.33,
          decoration: const BoxDecoration(
            color: Colors.green
          ),
        ),
      ),*/
        );
  }
}
