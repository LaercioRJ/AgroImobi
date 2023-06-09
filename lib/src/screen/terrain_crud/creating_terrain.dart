import 'package:flutter/material.dart';

import 'specific_widgets/labeled_icon_button.dart';

import './create_forms/basic_info_form.dart';
import './create_forms/payment_form.dart';
/*import './create_forms/photo_form.dart';*/
import './create_forms/specific_info_form.dart';

import '../../classes/terrain.dart';

class CreatingTerrain extends StatefulWidget {
  late Terrain terrainReference;
  final Function changeAction;
  CreatingTerrain({super.key, required this.changeAction});
  final _pageController = PageController(initialPage: 0);

  nextStep(int newPageNumber, Terrain terrainRefresh) {
    forms.add(pageList[newPageNumber - 1]);
    _pageController.animateToPage(newPageNumber, duration: const Duration(milliseconds: 750), curve: Curves.ease);
  }

  late List<Widget> forms = [
    BasicInfoForm(
      onSubmit: nextStep,
      terrainReference: terrainReference
    )
  ];

  late final pageList = [
    SpecificInfoForm(onSubmit: nextStep, terrainReference: terrainReference ),
    /*PhotoForm(onSubmit: () { nextStep(3); }),*/
    const PaymentForm()
  ];

  @override
  State<CreatingTerrain> createState() => _CreatingTerrainState();
}

class _CreatingTerrainState extends State<CreatingTerrain> {

  @override
  initState() {
    widget.terrainReference = Terrain.createEmptyObject();
    super.initState();
  }

  Future<bool> _onBackPressed() {
    widget.changeAction("Visualizar");
    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    List<Color> menuColors = [
      Colors.green,
      Colors.grey.shade400,
      Colors.grey.shade400,
      Colors.grey.shade400,
    ];

    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Criar Anúncio'),
          backgroundColor: Colors.green,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(2, 4, 2, 10),
              child: Row(
                children: [
                  LabeledIconButton(
                    label: 'Info Gerais',
                    icon: const Icon(Icons.edit_square),
                    color: menuColors[0],
                    pressedFunction: () => {
                      widget._pageController.animateToPage(0, duration: const Duration(milliseconds: 750), curve: Curves.ease)
                    },
                  ),
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.black,
                            width: 2.0
                          )
                        )
                      ),
                    )
                  ),
                  LabeledIconButton(
                    label: 'Detalhes',
                    icon: const Icon(Icons.map),
                    color: menuColors[1],
                    pressedFunction: () => {
                      widget._pageController.animateToPage(1, duration: const Duration(milliseconds: 750), curve: Curves.ease),
                      menuColors[2] = Colors.green
                    },
                  ),
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.black,
                            width: 2.0
                          )
                        )
                      ),
                    )
                  ),
                  LabeledIconButton(
                    label: 'Ad. Fotos',
                    icon: const Icon(Icons.add_photo_alternate),
                    color: menuColors[2],
                    pressedFunction: () => {
                      widget._pageController.animateToPage(2, duration: const Duration(milliseconds: 750), curve: Curves.ease)
                    },
                  ),
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.black,
                            width: 2.0
                          )
                        )
                      ),
                    )
                  ),
                  LabeledIconButton(
                    label: 'Pagamento',
                    icon: const Icon(Icons.receipt_long),
                    color: menuColors[3],
                    pressedFunction: () => {
                      widget._pageController.animateToPage(3, duration: const Duration(milliseconds: 750), curve: Curves.ease)
                    },
                  )
                ],
              )
            ),
            Expanded(
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: PageView.builder(
                  itemCount: 4,
                  pageSnapping: true,
                  controller: widget._pageController,
                  itemBuilder: (context, pagePostion) {
                    return widget.forms[pagePostion];
                  }
                )
              ),
            )
          ],
        )
      )
    );
  }
}

