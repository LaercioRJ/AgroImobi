import 'package:flutter/material.dart';

import 'specific_widgets/labeled_icon_button.dart';

import './create_forms/basic_info_form.dart';
import './create_forms/payment_form.dart';
/*import './create_forms/photo_form.dart';*/
import './create_forms/specific_info_form.dart';

import '../../classes/terrain.dart';

class CreatingTerrain extends StatefulWidget {
  final Function changeAction;
  final _pageController = PageController(initialPage: 0);

  CreatingTerrain({super.key, required this.changeAction});

  @override
  State<CreatingTerrain> createState() => _CreatingTerrainState();
}

class _CreatingTerrainState extends State<CreatingTerrain> {
  var buttonsColors = [
    ValueNotifier(Colors.green),
    ValueNotifier(Colors.grey.shade400),
    ValueNotifier(Colors.grey.shade400),
    ValueNotifier(Colors.grey.shade400)
  ];
  late Terrain terrainReference;

  late List<Widget> forms = [
    BasicInfoForm(onSubmit: nextStep, terrainReference: terrainReference)
  ];

  late final pageList = [
    SpecificInfoForm(onSubmit: nextStep, terrainReference: terrainReference),
    /*PhotoForm(onSubmit: () { nextStep(3); }),*/
    const PaymentForm()
  ];

  nextStep(int newPageNumber, Terrain terrainRefresh) {
    forms.add(pageList[newPageNumber - 1]);
    widget._pageController.animateToPage(newPageNumber,
        duration: const Duration(milliseconds: 750), curve: Curves.ease);
    terrainReference = terrainRefresh;
    buttonsColors[1].value = Colors.green;
  }

  @override
  initState() {
    // Object that will be filled by the user
    terrainReference = Terrain.createEmptyObject();
    super.initState();
  }

  //changes route configuration to get back to visualize my terrains
  Future<bool> _onBackPressed() {
    widget.changeAction("Visualizar");
    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        // will execute this function when back buttom pressed and the view poped
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
                        ValueListenableBuilder(
                            valueListenable: buttonsColors[0],
                            builder: (context, color, _) => LabeledIconButton(
                                  label: 'Info Gerais',
                                  icon: const Icon(Icons.edit_square),
                                  color: color,
                                  pressedFunction: () => {
                                    widget._pageController.animateToPage(0,
                                        duration:
                                            const Duration(milliseconds: 750),
                                        curve: Curves.ease)
                                  },
                                )),
                        Expanded(
                            child: Container(
                          decoration: const BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: Colors.black, width: 2.0))),
                        )),
                        ValueListenableBuilder(
                            valueListenable: buttonsColors[1],
                            builder: (context, color, _) => LabeledIconButton(
                                  label: 'Detalhes',
                                  icon: const Icon(Icons.map),
                                  color: color,
                                  disabled: (forms.length < 2),
                                  pressedFunction: () => {
                                    widget._pageController.animateToPage(1,
                                        duration:
                                            const Duration(milliseconds: 750),
                                        curve: Curves.ease),
                                  },
                                )),
                        Expanded(
                            child: Container(
                          decoration: const BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: Colors.black, width: 2.0))),
                        )),
                        ValueListenableBuilder(
                            valueListenable: buttonsColors[2],
                            builder: (context, color, _) => LabeledIconButton(
                                  label: 'Ad. Fotos',
                                  icon: const Icon(Icons.add_photo_alternate),
                                  color: color,
                                  disabled: (forms.length < 3),
                                  pressedFunction: () => {
                                    widget._pageController.animateToPage(2,
                                        duration:
                                            const Duration(milliseconds: 750),
                                        curve: Curves.ease)
                                  },
                                )),
                        Expanded(
                            child: Container(
                          decoration: const BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: Colors.black, width: 2.0))),
                        )),
                        ValueListenableBuilder(
                            valueListenable: buttonsColors[3],
                            builder: (context, color, _) => LabeledIconButton(
                                  label: 'Pagamento',
                                  icon: const Icon(Icons.receipt_long),
                                  color: color,
                                  disabled: (forms.length < 4),
                                  pressedFunction: () => {
                                    widget._pageController.animateToPage(3,
                                        duration:
                                            const Duration(milliseconds: 750),
                                        curve: Curves.ease)
                                  },
                                ))
                      ],
                    )),
                Expanded(
                  child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: PageView.builder(
                          itemCount: 4,
                          pageSnapping: true,
                          controller: widget._pageController,
                          itemBuilder: (context, pagePostion) {
                            return forms[pagePostion];
                          })),
                )
              ],
            )));
  }
}
